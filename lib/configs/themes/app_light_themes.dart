import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learning_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFF85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);

/* when use mixin, we need to use "with" instead of extends */
class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
            bodyColor: mainTextColorLight, displayColor: mainTextColorLight));
  }
}