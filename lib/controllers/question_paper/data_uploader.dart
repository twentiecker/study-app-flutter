import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../firebase_ref/loading_status.dart';
import '../../firebase_ref/references.dart';
import '../../model/question_paper_model.dart';

class DataUploader extends GetxController {
  /* calls only once to upload data */
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  /* create observable variable */
  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    /* set status "loading" as default one for uploading data */
    loadingStatus.value = LoadingStatus.loading;
    /* create fireStore instance */
    final fireStore = FirebaseFirestore.instance;
    /* loading all assets folder into 'AssetManifest.json' */
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    /* decode manifestContent from json file */
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    /* filter manifestMap for only 'assets/DB/papers' that contain '.json' */
    final paperInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/papers') && path.contains('.json'))
        .toList();
    // print(paperInAssets);
    /* create variable list from QuestionPaperModel */
    List<QuestionPaperModel> questionPapers = [];
    /* read the content of the file that we get from paperInAssets */
    for (var paper in paperInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      // print(stringPaperContent);
    }
    // print('Items number ${questionPapers.length}');
    // print(questionPapers[0].questions![2].id);
    /* upload multiple data to firebase with batch operation */
    var batch = fireStore.batch();
    for (var paper in questionPapers) {
      /* paper.id as name of collection (table) */
      batch.set(questionPaperRF.doc(paper.id), {
        /* set the key value of data */
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length
      });
      /* create questions to firebase as new collection and data */
      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });
        /* create answers to firebase as new collection and data */
        for (var answers in questions.answers) {
          final answerPath =
              questionPath.collection('answers').doc(answers.identifier);
          batch.set(answerPath,
              {"identifier": answers.identifier, "answer": answers.answer});
        }
      }
    }
    /* submit batch into firebase database */
    await batch.commit();
    /* change status from "loading" into "completed" one */
    loadingStatus.value = LoadingStatus.completed;
  }
}
