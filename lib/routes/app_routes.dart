import 'package:get/get.dart';
import 'package:learning_app/controllers/question_paper/questions_controller.dart';
import 'package:learning_app/screens/question/answer_check_screen.dart';
import 'package:learning_app/screens/question/questions_screen.dart';
import '../controllers/leaderboard_controller.dart';
import '../controllers/question_paper/question_paper_controller.dart';
import '../controllers/zoom_drawer_controller.dart';
import '../screens/board/leaderboard_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/introduction/introduction_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/question/questions_overview_screen.dart';
import '../screens/question/result_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: IntroductionScreen.routeName,
            page: () => const IntroductionScreen()),
        GetPage(
            name: HomeScreen.routeName,
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            name: ProfileScreen.routeName, page: () => const ProfileScreen()),
        GetPage(
            name: LeaderboardScreen.routeName,
            page: () => const LeaderboardScreen(),
            binding: BindingsBuilder(() {
              Get.put(LeaderboardController());
            })),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => const QuestionsScreen(),
            binding: BindingsBuilder(() {
              /* defining <QuestionsController> cz we have set an "id" in QuestionsScreen */
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
            name: QuestionsOverviewScreen.routeName,
            page: () => const QuestionsOverviewScreen()),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: AnswerCheckScreen.routeName,
          page: () => const AnswerCheckScreen(),
        )
      ];
}
