import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/themes/ui_parameters.dart';
import 'package:learning_app/controllers/question_paper/questions_controller.dart';
import 'package:learning_app/controllers/question_paper/questions_controller_extension.dart';
import 'package:learning_app/screens/question/answer_check_screen.dart';
import 'package:learning_app/widgets/questions/answer_card.dart';
import 'package:learning_app/widgets/questions/question_number_card.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/main_button.dart';
import '../../widgets/content_area.dart';

// class ResultScreen extends StatelessWidget {
class ResultScreen extends GetView<QuestionsController> {
  static const String routeName = "/result";

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: SizedBox(
          height: 80,
        ),
        title: controller.correctAnsweredQuestions,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
                child: ContentArea(
              child: Column(
                children: [
                  SvgPicture.asset("assets/images/bulb.svg"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      "Congratulations",
                      style: headerText.copyWith(color: _textColor),
                    ),
                  ),
                  Text(
                    'You have ${controller.points} points',
                    style: TextStyle(color: _textColor),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Tap below question number to view correct answer',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                      child: GridView.builder(
                          itemCount: controller.allQuestions.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: Get.width ~/ 75,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8),
                          itemBuilder: (_, index) {
                            final _question = controller.allQuestions[index];
                            AnswerStatus _status = AnswerStatus.notanswered;
                            final _selectedAnswer = _question.selectedAnswer;
                            final _correctAnswer = _question.correctAnswer;
                            if (_selectedAnswer == _correctAnswer) {
                              _status = AnswerStatus.correct;
                            } else {
                              _status = AnswerStatus.wrong;
                            }
                            return QuestionNumberCard(
                                index: index + 1,
                                status: _status,
                                onTap: () {
                                  controller.jumpToQuestion(index,
                                      isGoBack: false);
                                  Get.toNamed(AnswerCheckScreen.routeName);
                                });
                          }))
                ],
              ),
            )),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: UIParameters.mobileScreenPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(
                        onTap: () {
                          controller.tryAgain();
                        },
                        color: Colors.blueGrey,
                        title: 'Try again',
                      ),
                    ),
                    SizedBox(height: 5,),
                    Expanded(
                      child: MainButton(
                        onTap: () {
                          controller.saveTestResults();
                        },
                        title: 'Go home',
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
