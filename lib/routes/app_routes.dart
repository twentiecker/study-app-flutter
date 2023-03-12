import 'package:get/get.dart';

import '../screens/introduction/introduction_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => IntroductionScreen())
      ];
}
