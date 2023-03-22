import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/themes/custom_text_styles.dart';
import 'package:learning_app/controllers/question_paper/questions_controller.dart';
import 'package:learning_app/widgets/common/background_decoration.dart';
import 'package:learning_app/widgets/content_area.dart';
import 'package:learning_app/widgets/questions/answer_card.dart';
import 'package:learning_app/widgets/questions/countdown_timer.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/questions/question_number_card.dart';

// class QuestionsOverviewScreen extends StatelessWidget {
class QuestionsOverviewScreen extends GetView<QuestionsController> {
  static const String routeName = "/overview";

  const QuestionsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
                child: ContentArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      CountdownTimer(
                          color: UIParameters.isDarkMode()
                              ? Theme.of(context).textTheme.bodyText1!.color
                              : Theme.of(context).primaryColor,
                          time: ''),
                      Obx(() => Text(
                            '${controller.time} Remaining',
                            style: countdownText(context),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.allQuestions.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 75,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        itemBuilder: (_, index) {
                          AnswerStatus? _answerStatus;
                          if (controller.allQuestions[index].selectedAnswer !=
                              null) {
                            _answerStatus = AnswerStatus.answered;
                          }
                          return QuestionNumberCard(
                            index: index + 1,
                            status: _answerStatus,
                            onTap: () => controller.jumpToQuestion(index),
                          );
                        }),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
