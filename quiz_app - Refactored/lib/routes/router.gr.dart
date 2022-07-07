// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../ui/Screens/Admin/dashboard.dart' as _i15;
import '../ui/Screens/Admin/user_list.dart' as _i14;
import '../ui/Screens/Auth/Login/login_screen.dart' as _i2;
import '../ui/Screens/Auth/Signup/signup_onepage.dart' as _i3;
import '../ui/Screens/Category/category_screen.dart' as _i4;
import '../ui/Screens/Category/choose_type_screen.dart' as _i6;
import '../ui/Screens/Category/languages_screen.dart' as _i5;
import '../ui/Screens/Profile/edit_profile_screen.dart' as _i12;
import '../ui/Screens/Profile/my_scores_screen.dart' as _i13;
import '../ui/Screens/Profile/profile_screen.dart' as _i10;
import '../ui/Screens/Profile/user_details_screen.dart' as _i11;
import '../ui/Screens/Question/questions_screen.dart' as _i7;
import '../ui/Screens/Score/final_practice_score.dart' as _i8;
import '../ui/Screens/Score/review_page.dart' as _i9;
import '../ui/Screens/Splash/splash_screen.dart' as _i1;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      final args =
          routeData.argsAs<SplashArgs>(orElse: () => const SplashArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.Splash(key: args.key));
    },
    LoginRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage());
    },
    OneSignupRoute.name: (routeData) {
      final args = routeData.argsAs<OneSignupRouteArgs>(
          orElse: () => const OneSignupRouteArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.OneSignupPage(key: args.key));
    },
    CategoryRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CategoryPage());
    },
    LanguageChoices.name: (routeData) {
      final args = routeData.argsAs<LanguageChoicesArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.LanguageChoices(key: args.key, courses: args.courses));
    },
    ChooseType.name: (routeData) {
      final args = routeData.argsAs<ChooseTypeArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ChooseType(
            key: args.key,
            icon: args.icon,
            path: args.path,
            ptype: args.ptype,
            ftype: args.ftype,
          ));
    },
    QuestionsScreen.name: (routeData) {
      final args = routeData.argsAs<QuestionsScreenArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.QuestionsScreen(
              key: args.key,
              icon: args.icon,
              path: args.path,
              isFinal: args.isFinal));
    },
    FinalScore.name: (routeData) {
      final args = routeData.argsAs<FinalScoreArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.FinalScore(
              key: args.key,
              outOf: args.outOf,
              score: args.score,
              optionList: args.optionList));
    },
    ReviewScreen.name: (routeData) {
      final args = routeData.argsAs<ReviewScreenArgs>(
          orElse: () => const ReviewScreenArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.ReviewScreen(key: args.key));
    },
    ProfileScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ProfileScreen());
    },
    UserDetailsScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.UserDetailsScreen());
    },
    EditProfileScreen.name: (routeData) {
      final args = routeData.argsAs<EditProfileScreenArgs>(
          orElse: () => const EditProfileScreenArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.EditProfileScreen(key: args.key));
    },
    MyScoresScreen.name: (routeData) {
      final args = routeData.argsAs<MyScoresScreenArgs>(
          orElse: () => const MyScoresScreenArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.MyScoresScreen(key: args.key));
    },
    UsersListRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.UsersListPage());
    },
    DashboardRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.DashboardPage());
    }
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(Splash.name, path: '/'),
        _i16.RouteConfig(LoginRoute.name, path: '/login'),
        _i16.RouteConfig(OneSignupRoute.name, path: '/signup'),
        _i16.RouteConfig(CategoryRoute.name, path: '/category'),
        _i16.RouteConfig(LanguageChoices.name, path: '/language-choices'),
        _i16.RouteConfig(ChooseType.name, path: '/choose-type'),
        _i16.RouteConfig(QuestionsScreen.name, path: '/questions'),
        _i16.RouteConfig(FinalScore.name, path: '/finalScore'),
        _i16.RouteConfig(ReviewScreen.name, path: '/review_screen'),
        _i16.RouteConfig(ProfileScreen.name, path: '/profile'),
        _i16.RouteConfig(UserDetailsScreen.name, path: '/personal_details'),
        _i16.RouteConfig(EditProfileScreen.name, path: '/edit_profile'),
        _i16.RouteConfig(MyScoresScreen.name, path: '/my_scores'),
        _i16.RouteConfig(UsersListRoute.name, path: '/users'),
        _i16.RouteConfig(DashboardRoute.name, path: '/dahboard')
      ];

  // static get ptype => null;
}

/// generated route for
/// [_i1.Splash]
class Splash extends _i16.PageRouteInfo<SplashArgs> {
  Splash({_i17.Key? key})
      : super(Splash.name, path: '/', args: SplashArgs(key: key));

  static const String name = 'Splash';
}

class SplashArgs {
  const SplashArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'SplashArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.OneSignupPage]
class OneSignupRoute extends _i16.PageRouteInfo<OneSignupRouteArgs> {
  OneSignupRoute({_i17.Key? key})
      : super(OneSignupRoute.name,
            path: '/signup', args: OneSignupRouteArgs(key: key));

  static const String name = 'OneSignupRoute';
}

class OneSignupRouteArgs {
  const OneSignupRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'OneSignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryRoute extends _i16.PageRouteInfo<void> {
  const CategoryRoute() : super(CategoryRoute.name, path: '/category');

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i5.LanguageChoices]
class LanguageChoices extends _i16.PageRouteInfo<LanguageChoicesArgs> {
  LanguageChoices({_i17.Key? key, required dynamic courses})
      : super(LanguageChoices.name,
            path: '/language-choices',
            args: LanguageChoicesArgs(key: key, courses: courses));

  static const String name = 'LanguageChoices';
}

class LanguageChoicesArgs {
  const LanguageChoicesArgs({this.key, required this.courses});

  final _i17.Key? key;

  final dynamic courses;

  @override
  String toString() {
    return 'LanguageChoicesArgs{key: $key, courses: $courses}';
  }
}

/// generated route for
/// [_i6.ChooseType]
class ChooseType extends _i16.PageRouteInfo<ChooseTypeArgs> {
  ChooseType({_i17.Key? key, required dynamic icon, required String path})
      : super(ChooseType.name,
            path: '/choose-type',
            args: ChooseTypeArgs(key: key, icon: icon, path: path));

  static const String name = 'ChooseType';
}

class ChooseTypeArgs {
  const ChooseTypeArgs(
      {this.key,
      required this.icon,
      required this.path,
      this.ptype,
      this.ftype});

  final _i17.Key? key;

  final dynamic icon;

  final String path;
  final String? ptype;
  final String? ftype;

  @override
  String toString() {
    return 'ChooseTypeArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i7.QuestionsScreen]
class QuestionsScreen extends _i16.PageRouteInfo<QuestionsScreenArgs> {
  QuestionsScreen(
      //required icon,
      {_i17.Key? key,
      required dynamic icon,
      required String path,
      required bool isFinal,
      String? ptype,
      String? ftype})
      : super(QuestionsScreen.name,
            path: '/questions',
            args: QuestionsScreenArgs(
                key: key, icon: icon, path: path, isFinal: isFinal));

  static const String name = 'QuestionsScreen';
}

class QuestionsScreenArgs {
  const QuestionsScreenArgs(
      {this.key,
      required this.icon,
      required this.path,
      required this.isFinal});

  final _i17.Key? key;

  final dynamic icon;

  final String path;

  final bool isFinal;

  @override
  String toString() {
    return 'QuestionsScreenArgs{key: $key, icon: $icon, path: $path, isFinal: $isFinal}';
  }
}

/// generated route for
/// [_i8.FinalScore]
class FinalScore extends _i16.PageRouteInfo<FinalScoreArgs> {
  FinalScore(
      {_i17.Key? key,
      required int outOf,
      required int score,
      required int optionList})
      : super(FinalScore.name,
            path: '/finalScore',
            args: FinalScoreArgs(
                key: key, outOf: outOf, score: score, optionList: optionList));

  static const String name = 'FinalScore';
}

class FinalScoreArgs {
  const FinalScoreArgs(
      {this.key,
      required this.outOf,
      required this.score,
      required this.optionList});

  final _i17.Key? key;

  final int outOf;

  final int score;

  final int optionList;

  @override
  String toString() {
    return 'FinalScoreArgs{key: $key, outOf: $outOf, score: $score, optionList: $optionList}';
  }
}

/// generated route for
/// [_i9.ReviewScreen]
class ReviewScreen extends _i16.PageRouteInfo<ReviewScreenArgs> {
  ReviewScreen({_i17.Key? key})
      : super(ReviewScreen.name,
            path: '/review_screen', args: ReviewScreenArgs(key: key));

  static const String name = 'ReviewScreen';
}

class ReviewScreenArgs {
  const ReviewScreenArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'ReviewScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileScreen extends _i16.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '/profile');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i11.UserDetailsScreen]
class UserDetailsScreen extends _i16.PageRouteInfo<void> {
  const UserDetailsScreen()
      : super(UserDetailsScreen.name, path: '/personal_details');

  static const String name = 'UserDetailsScreen';
}

/// generated route for
/// [_i12.EditProfileScreen]
class EditProfileScreen extends _i16.PageRouteInfo<EditProfileScreenArgs> {
  EditProfileScreen({_i17.Key? key})
      : super(EditProfileScreen.name,
            path: '/edit_profile', args: EditProfileScreenArgs(key: key));

  static const String name = 'EditProfileScreen';
}

class EditProfileScreenArgs {
  const EditProfileScreenArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'EditProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.MyScoresScreen]
class MyScoresScreen extends _i16.PageRouteInfo<MyScoresScreenArgs> {
  MyScoresScreen({_i17.Key? key})
      : super(MyScoresScreen.name,
            path: '/my_scores', args: MyScoresScreenArgs(key: key));

  static const String name = 'MyScoresScreen';
}

class MyScoresScreenArgs {
  const MyScoresScreenArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'MyScoresScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.UsersListPage]
class UsersListRoute extends _i16.PageRouteInfo<void> {
  const UsersListRoute() : super(UsersListRoute.name, path: '/users');

  static const String name = 'UsersListRoute';
}

/// generated route for
/// [_i15.DashboardPage]
class DashboardRoute extends _i16.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/dahboard');

  static const String name = 'DashboardRoute';
}
