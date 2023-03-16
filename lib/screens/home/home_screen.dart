import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/themes/ui_parameters.dart';
import 'package:learning_app/screens/home/question_card.dart';

import '../../controllers/question_paper/question_paper_controller.dart';
import '../../widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: ContentArea(
          addPadding: false,
          child: Obx(() => ListView.separated(
              padding: UIParameters.mobileScreenPadding,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return QuestionCard(
                    model: _questionPaperController.allPapers[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: _questionPaperController.allPapers.length)),
        ));
  }
}
