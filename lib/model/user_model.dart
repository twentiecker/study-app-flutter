import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id, email, name;
  String? profilepic;
  List<Tests> listTest;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      this.profilepic,
      required this.listTest});

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        email = snapshot['email'],
        name = snapshot['name'],
        profilepic = snapshot['profilepic'],
        listTest = [];
}

class Tests {
  String id, correctAnswers, points, questionId;
  int time;

  Tests(
      {required this.id,
      required this.correctAnswers,
      required this.points,
      required this.questionId,
      required this.time});

  Tests.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        correctAnswers = snapshot['correct_answers'],
        points = snapshot['points'],
        questionId = snapshot['question_id'],
        time = snapshot['time'];
}
