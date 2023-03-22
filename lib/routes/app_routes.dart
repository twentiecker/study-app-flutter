import 'package:get/get.dart';
import 'package:learning_app/controllers/question_paper/questions_controller.dart';
import 'package:learning_app/screens/question/questions_screen.dart';
import '../controllers/question_paper/question_paper_controller.dart';
import '../controllers/zoom_drawer_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/introduction/introduction_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/question/questions_overview_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(
            name: IntroductionScreen.routeName,
            page: () => IntroductionScreen()),
        GetPage(
            name: HomeScreen.routeName,
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => QuestionsScreen(),
            binding: BindingsBuilder(() {
              /* defining <QuestionsController> cz we have set an "id" in QuestionsScreen */
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
            name: QuestionsOverviewScreen.routeName,
            page: () => QuestionsOverviewScreen()),
      ];
}
