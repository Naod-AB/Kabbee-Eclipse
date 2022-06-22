import 'package:auto_route/annotations.dart';
import 'package:quiz_app/ui/Screens/Auth/Login/login_screen.dart';
import 'package:quiz_app/ui/Screens/Auth/Signup/signup_onepage.dart';
import 'package:quiz_app/ui/Screens/Category/category_screen.dart';
import 'package:quiz_app/ui/Screens/Category/choose_type_screen.dart';
import 'package:quiz_app/ui/Screens/Category/languages_screen.dart';
import 'package:quiz_app/ui/Screens/Profile/edit_profile_screen.dart';
import 'package:quiz_app/ui/Screens/Profile/my_scores_screen.dart';
import 'package:quiz_app/ui/Screens/Profile/profile_screen.dart';

import 'package:quiz_app/ui/Screens/Question/questions_screen.dart';
import 'package:quiz_app/ui/Screens/Score/final_practice_score.dart';
import 'package:quiz_app/ui/Screens/Score/review_page.dart';
import 'package:quiz_app/ui/Screens/Splash/splash_screen.dart';

import '../ui/Screens/Profile/user_details_screen.dart';
// import '../screens/Category/back_end_choices.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Splash, initial: true),
    AutoRoute(path: '/login', page: LoginPage),
    AutoRoute(path: '/signup', page: OneSignupPage),
    AutoRoute(path: '/category', page: CategoryPage),
    AutoRoute(path: '/language-choices', page: LanguageChoices),
    AutoRoute(path: '/choose-type', page: ChooseType),
    AutoRoute(path: '/questions', page: QuestionsScreen),
    AutoRoute(path: '/finalScore', page: FinalScore),
    AutoRoute(path: '/review_screen', page: ReviewScreen),
    AutoRoute(path: '/profile', page: ProfileScreen),
    AutoRoute(path: '/personal_details', page: UserDetailsScreen),
    AutoRoute(path: '/edit_profile', page: EditProfileScreen),
    AutoRoute(path: '/my_scores', page: MyScoresScreen),
  ],
)
class $AppRouter {}
