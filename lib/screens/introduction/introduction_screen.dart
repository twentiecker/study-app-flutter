import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_app/widgets/app_circle_button.dart';

import '../../configs/themes/app_colors.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 65,
              color: Colors.amber,
            ),
            SizedBox(height: 40),
            Text(
                'This is a study app. You can use it as you want. If you understand how this works, you would be able to scale it'),
            SizedBox(height: 40),
            AppCircleButton(
              onTap: () => null,
              child: Icon(
                Icons.arrow_forward,
              ),
            )
          ],
        ),
      ),
    );
  }
}
