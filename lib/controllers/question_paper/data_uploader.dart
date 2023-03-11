import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../model/question_paper_model.dart';

class DataUploader extends GetxController {
  /* calls only once to upload data */
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
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
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      // print(stringPaperContent);
    }
    // print('Items number ${questionPapers.length}');
    // print(questionPapers[0].questions![2].id);
  }
}
