import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/themes/app_dark_themes.dart';
import '../configs/themes/app_light_themes.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme, _lightTheme;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;

  ThemeData get lightTheme => _lightTheme;
}
