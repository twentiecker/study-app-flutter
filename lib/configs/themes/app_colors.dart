import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_dark_themes.dart';
import 'app_light_themes.dart';
import 'ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFFf85187);
const Color notAnswerColor = Color(0xFF2a3c65);

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color(0xff2e3c62)
    : Color.fromARGB(255, 240, 237, 255);

Color answerSelectedColor(BuildContext context) => UIParameters.isDarkMode()
    ? Theme.of(context).cardColor.withOpacity(0.5)
    : Theme.of(context).primaryColor;

Color answerBorderColor(BuildContext context) => UIParameters.isDarkMode()
    ? Color.fromARGB(255, 20, 46, 158)
    : Color.fromARGB(255, 221, 221, 221);

/* in case if answerSelectedColor is failed to be executed */
// Color answerSelectedColor() => UIParameters.isDarkMode()
//     ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
//     : Theme.of(Get.context!).primaryColor;
