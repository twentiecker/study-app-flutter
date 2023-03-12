import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/themes/app_light_themes.dart';
import 'package:learning_app/controllers/question_paper/data_uploader_screen.dart';
import 'package:learning_app/controllers/theme_controller.dart';
import 'package:learning_app/firebase_options.dart';
import 'package:learning_app/routes/app_routes.dart';
import 'package:learning_app/screens/introduction/introduction_screen.dart';
import 'package:learning_app/screens/splash/splash_screen.dart';

import 'bindings/initial_bindings.dart';
import 'configs/themes/app_dark_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /* inject dependencies from bindings */
  InitialBindings().dependencies();
  runApp(const MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   /* initialize Firebase and add plugins */
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* use GetMaterialApp to call DataUploaderScreen to create controller instance */
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      // theme: LightTheme().buildLightTheme(),
      // theme: DarkTheme().buildDarkTheme(),
      getPages: AppRoutes.routes(),
    );

    // /* use GetMaterialApp to call DataUploaderScreen to create controller instance */
    // return GetMaterialApp(
    //   home: DataUploaderScreen(),
    // );
  }
}
