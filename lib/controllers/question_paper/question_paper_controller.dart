import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:learning_app/controllers/auth_controller.dart';
import 'package:learning_app/firebase_ref/references.dart';
import 'package:learning_app/services/firebase_storage_service.dart';
import '../../model/question_paper_model.dart';

class QuestionPaperController extends GetxController {
  // /* define list reacted variable of images with as obs */
  // final allPaperImages = <String>[].obs;

  /* define data for papers from firebase database */
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // /* name of the file in firebase storage */
    // List<String> imgName = ["biology", "chemistry", "maths", "physics"];

    try {
      /* getting all data from firebase database */
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      /* loop through imgName to get the image url from firebase storage */
      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;

        // final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        // /* save all the image url into list */
        // allPaperImages.add(imgUrl!);
      }
      allPapers.assignAll(paperList);
    } catch (error) {
      // AppLogger.e(error)
      print(error);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed(page);
      } else {
        // print('Already logged in');
        // Get.toNamed(page);
      }
    } else {
      // print('The title is: ${paper.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}
