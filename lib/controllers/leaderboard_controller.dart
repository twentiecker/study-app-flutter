import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../app_logger.dart';
import '../firebase_ref/references.dart';
import '../model/user_model.dart';

class LeaderboardController extends GetxController {
  final allUser = <UserModel>[];
  final allUserFinal = <UserModel>[].obs;

  // final allRank = {};
  // var cobaMap = [];
  // List<UserModel> cobaMapList = [];
  // List<Map<String, dynamic>> cobaMapBreak = [];

  @override
  void onReady() {
    getAllUserData();
    super.onReady();
  }

  Future<void> getAllUserData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> userData = await userRF.get();
      final userList =
          userData.docs.map((user) => UserModel.fromSnapshot(user)).toList();
      allUser.assignAll(userList);

      for (var user in allUser) {
        QuerySnapshot<Map<String, dynamic>> testData =
            await userRF.doc(user.id).collection("myrecent_tests").get();
        final testList =
            testData.docs.map((test) => Tests.fromSnapshot(test)).toList();

        user.listTest.assignAll(testList);
      }
    } catch (error) {
      AppLogger.e(error);
    }

    // menghitung global score (total points dari seluruh pembelajaran)
    double score = 0;
    var prev_email = '';
    for (var user in allUser) {
      // print(user.email);
      for (var test in user.listTest) {
        if (user.email != prev_email){
          score = 0;
          prev_email = user.email;
        }
        score = score + double.parse(test.points);
        // print(test.points);
        // print(score);
      }
      var dataGlobal = Tests(
          id: "global",
          correctAnswers: "",
          points: score.toStringAsFixed(2),
          questionId: "global",
          time: 0);
      user.listTest.add(dataGlobal);
    }

    // print(allUser.length);
    // print(allUser.map((e) => print((e.listTest).runtimeType)));
    // print(allUser.map((e) => print(e.listTest[e.listTest.length - 1].points)));

    // sorting data with global points value
    allUser.sort((b, a) => a.listTest[a.listTest.length - 1].points
        .compareTo(b.listTest[b.listTest.length - 1].points));

    // assign the final data
    allUserFinal.assignAll(allUser);

    // // print nilai
    // print(allUserFinal.value[0].listTest[0].points);
  }
}
