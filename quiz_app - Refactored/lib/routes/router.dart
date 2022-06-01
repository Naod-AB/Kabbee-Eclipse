import 'package:auto_route/annotations.dart';
import 'package:quiz_app/ui/Screens/Auth/Login/login_screen.dart';
import 'package:quiz_app/ui/Screens/Auth/Signup/signup_onepage.dart';
import 'package:quiz_app/ui/Screens/Category/category_screen.dart';
import 'package:quiz_app/ui/Screens/Category/choose_type_screen.dart';
import 'package:quiz_app/ui/Screens/Category/languages_screen.dart';
import 'package:quiz_app/ui/Screens/Profile/edit_profile_screen.dart';
import 'package:quiz_app/ui/Screens/Profile/my_scores_screen.dart';
import 'package:quiz_app/ui/Screens/Profile/profile_screen.dart';
import 'package:quiz_app/ui/Screens/Question/question_screen.dart';
import 'package:quiz_app/ui/Screens/Question/evalu_screen.dart';
import 'package:quiz_app/ui/Screens/Score/final_practice_score.dart';
import 'package:quiz_app/ui/Screens/Score/review_page.dart';
import 'package:quiz_app/ui/Screens/Splash/splash_screen.dart';
// import '../screens/Category/back_end_choices.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Splash, initial: true),
    AutoRoute(path: '/login', page: LoginPage),
    AutoRoute(path: '/signup', page: OneSignupPage),
    AutoRoute(path: '/category', page: CategoryPage),
    // AutoRoute(path: '/frontend', page: FrontEndChoices),
    // AutoRoute(path: '/backend', page: BackendChoices),
    // AutoRoute(path: '/cloud', page: CloudChoices),
    AutoRoute(path: '/language-choices', page: LanguageChoices),
    AutoRoute(path: '/choose-type', page: ChooseType),
    AutoRoute(path: '/questions', page: QuestionScreen),
    AutoRoute(path: '/evaluation', page: evaluationScreens),
    AutoRoute(path: '/finalScore', page: FinalScore),
    //AutoRoute(path: '/ExamScore', page: ExamScore),
    AutoRoute(path: '/review_screen', page: ReviewScreen),
    AutoRoute(path: '/profile', page: ProfileScreen),
    AutoRoute(path: '/edit_profile', page: EditProfileScreen),
    AutoRoute(path: '/my_scores', page: MyScoresScreen),
  ],
)
class $AppRouter {}
