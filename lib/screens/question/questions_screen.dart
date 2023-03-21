import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/firebase_ref/loading_status.dart';
import 'package:learning_app/widgets/common/question_place_holder.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../controllers/question_paper/questions_controller.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/content_area.dart';
import '../../widgets/questions/answer_card.dart';

// class QuestionsScreen extends StatelessWidget {
class QuestionsScreen extends GetView<QuestionsController> {
  // questionsscreen
  static const String routeName = "/questions";

  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Obx(() => Column(
              children: [
                if (controller.loadingStatus.value == LoadingStatus.loading)
                  Expanded(child: ContentArea(child: QuestionPlaceHolder())),
                if (controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(
                    child: ContentArea(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: questionText,
                            ),
                            GetBuilder<QuestionsController>(
                                id: 'answers_list',
                                builder: (context) {
                                  return ListView.separated(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(top: 25),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final answer = controller
                                            .currentQuestion
                                            .value!
                                            .answers[index];
                                        return AnswerCard(
                                          answer:
                                              '${answer.identifier}. ${answer.answer}',
                                          onTap: () {
                                            controller.selectedAnswer(
                                                answer.identifier);
                                          },
                                          isSelected: answer.identifier ==
                                              controller.currentQuestion.value!
                                                  .selectedAnswer,
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              SizedBox(
                                                height: 10,
                                              ),
                                      itemCount: controller.currentQuestion
                                          .value!.answers.length);
                                })
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
