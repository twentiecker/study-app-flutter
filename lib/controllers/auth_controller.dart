import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    /* set delayed time for 2 sec */
    await Future.delayed(Duration(seconds: 2));
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    /* this command will go to route that defined in the bracket */
    Get.offAllNamed("/introduction");
  }
}
