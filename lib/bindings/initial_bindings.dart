import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/theme_controller.dart';
import '../firebase_options.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
