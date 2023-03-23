import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/widgets/app_circle_button.dart';
import '../../configs/themes/app_colors.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = "/introduction";

  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 65,
            ),
            const SizedBox(height: 40),
            const Text(
              'This is a study app. You can use it as you want. If you understand how this works, you would be able to scale it. With this you will master firebase backend and flutter frontend',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            AppCircleButton(
              onTap: () => Get.offAndToNamed("/home"),
              child: const Icon(
                Icons.arrow_forward,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
