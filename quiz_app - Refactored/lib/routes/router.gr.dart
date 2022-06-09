// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../ui/Screens/Auth/Login/login_screen.dart' as _i2;
import '../ui/Screens/Auth/Signup/signup_onepage.dart' as _i3;
import '../ui/Screens/Category/category_screen.dart' as _i4;
import '../ui/Screens/Category/choose_type_screen.dart' as _i6;
import '../ui/Screens/Category/languages_screen.dart' as _i5;
import '../ui/Screens/Profile/edit_profile_screen.dart' as _i12;
import '../ui/Screens/Profile/my_scores_screen.dart' as _i13;
import '../ui/Screens/Profile/profile_screen.dart' as _i11;
import '../ui/Screens/Question/evalu_screen.dart' as _i8;
import '../ui/Screens/Question/question_screen.dart' as _i7;
import '../ui/Screens/Score/final_practice_score.dart' as _i9;
import '../ui/Screens/Score/review_page.dart' as _i10;
import '../ui/Screens/Splash/splash_screen.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Splash());
    },
    LoginRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage());
    },
    OneSignupRoute.name: (routeData) {
      final args = routeData.argsAs<OneSignupRouteArgs>(
          orElse: () => const OneSignupRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.OneSignupPage(key: args.key));
    },
    CategoryRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CategoryPage());
    },
    LanguageChoices.name: (routeData) {
      final args = routeData.argsAs<LanguageChoicesArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.LanguageChoices(key: args.key, courses: args.courses));
    },
    ChooseType.name: (routeData) {
      final args = routeData.argsAs<ChooseTypeArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i6.ChooseType(key: args.key, icon: args.icon, path: args.path));
    },
    QuestionScreen.name: (routeData) {
      final args = routeData.argsAs<QuestionScreenArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.QuestionScreen(
              key: args.key, icon: args.icon, path: args.path));
    },
    EvaluationScreens.name: (routeData) {
      final args = routeData.argsAs<EvaluationScreensArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.evaluationScreens(
              key: args.key, icon: args.icon, path: args.path));
    },
    FinalScore.name: (routeData) {
      final args = routeData.argsAs<FinalScoreArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.FinalScore(
              key: args.key,
              outOf: args.outOf,
              score: args.score,
              optionList: args.optionList));
    },
    ReviewScreen.name: (routeData) {
      final args = routeData.argsAs<ReviewScreenArgs>(
          orElse: () => const ReviewScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.ReviewScreen(key: args.key));
    },
    ProfileScreen.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ProfileScreen());
    },
    EditProfileScreen.name: (routeData) {
      final args = routeData.argsAs<EditProfileScreenArgs>(
          orElse: () => const EditProfileScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.EditProfileScreen(key: args.key));
    },
    MyScoresScreen.name: (routeData) {
      final args = routeData.argsAs<MyScoresScreenArgs>(
          orElse: () => const MyScoresScreenArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.MyScoresScreen(key: args.key));
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(Splash.name, path: '/'),
        _i14.RouteConfig(LoginRoute.name, path: '/login'),
        _i14.RouteConfig(OneSignupRoute.name, path: '/signup'),
        _i14.RouteConfig(CategoryRoute.name, path: '/category'),
        _i14.RouteConfig(LanguageChoices.name, path: '/language-choices'),
        _i14.RouteConfig(ChooseType.name, path: '/choose-type'),
        _i14.RouteConfig(QuestionScreen.name, path: '/questions'),
        _i14.RouteConfig(EvaluationScreens.name, path: '/evaluation'),
        _i14.RouteConfig(FinalScore.name, path: '/finalScore'),
        _i14.RouteConfig(ReviewScreen.name, path: '/review_screen'),
        _i14.RouteConfig(ProfileScreen.name, path: '/profile'),
        _i14.RouteConfig(EditProfileScreen.name, path: '/edit_profile'),
        _i14.RouteConfig(MyScoresScreen.name, path: '/my_scores')
      ];
}

/// generated route for
/// [_i1.Splash]
class Splash extends _i14.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: '/');

  static const String name = 'Splash';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.OneSignupPage]
class OneSignupRoute extends _i14.PageRouteInfo<OneSignupRouteArgs> {
  OneSignupRoute({_i15.Key? key})
      : super(OneSignupRoute.name,
            path: '/signup', args: OneSignupRouteArgs(key: key));

  static const String name = 'OneSignupRoute';
}

class OneSignupRouteArgs {
  const OneSignupRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'OneSignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryRoute extends _i14.PageRouteInfo<void> {
  const CategoryRoute() : super(CategoryRoute.name, path: '/category');

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i5.LanguageChoices]
class LanguageChoices extends _i14.PageRouteInfo<LanguageChoicesArgs> {
  LanguageChoices({_i15.Key? key, required dynamic courses})
      : super(LanguageChoices.name,
            path: '/language-choices',
            args: LanguageChoicesArgs(key: key, courses: courses));

  static const String name = 'LanguageChoices';
}

class LanguageChoicesArgs {
  const LanguageChoicesArgs({this.key, required this.courses});

  final _i15.Key? key;

  final dynamic courses;

  @override
  String toString() {
    return 'LanguageChoicesArgs{key: $key, courses: $courses}';
  }
}

/// generated route for
/// [_i6.ChooseType]
class ChooseType extends _i14.PageRouteInfo<ChooseTypeArgs> {
  ChooseType({_i15.Key? key, required dynamic icon, required String path})
      : super(ChooseType.name,
            path: '/choose-type',
            args: ChooseTypeArgs(key: key, icon: icon, path: path));

  static const String name = 'ChooseType';
}

class ChooseTypeArgs {
  const ChooseTypeArgs({this.key, required this.icon, required this.path});

  final _i15.Key? key;

  final dynamic icon;

  final String path;

  @override
  String toString() {
    return 'ChooseTypeArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i7.QuestionScreen]
class QuestionScreen extends _i14.PageRouteInfo<QuestionScreenArgs> {
  QuestionScreen({_i15.Key? key, required dynamic icon, required String path})
      : super(QuestionScreen.name,
            path: '/questions',
            args: QuestionScreenArgs(key: key, icon: icon, path: path));

  static const String name = 'QuestionScreen';
}

class QuestionScreenArgs {
  const QuestionScreenArgs({this.key, required this.icon, required this.path});

  final _i15.Key? key;

  final dynamic icon;

  final String path;

  @override
  String toString() {
    return 'QuestionScreenArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i8.evaluationScreens]
class EvaluationScreens extends _i14.PageRouteInfo<EvaluationScreensArgs> {
  EvaluationScreens(
      {_i15.Key? key, required dynamic icon, required String path})
      : super(EvaluationScreens.name,
            path: '/evaluation',
            args: EvaluationScreensArgs(key: key, icon: icon, path: path));

  static const String name = 'EvaluationScreens';
}

class EvaluationScreensArgs {
  const EvaluationScreensArgs(
      {this.key, required this.icon, required this.path});

  final _i15.Key? key;

  final dynamic icon;

  final String path;

  @override
  String toString() {
    return 'EvaluationScreensArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i9.FinalScore]
class FinalScore extends _i14.PageRouteInfo<FinalScoreArgs> {
  FinalScore(
      {_i15.Key? key,
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

  final _i15.Key? key;

  final int outOf;

  final int score;

  final int optionList;

  @override
  String toString() {
    return 'FinalScoreArgs{key: $key, outOf: $outOf, score: $score, optionList: $optionList}';
  }
}

/// generated route for
/// [_i10.ReviewScreen]
class ReviewScreen extends _i14.PageRouteInfo<ReviewScreenArgs> {
  ReviewScreen({_i15.Key? key})
      : super(ReviewScreen.name,
            path: '/review_screen', args: ReviewScreenArgs(key: key));

  static const String name = 'ReviewScreen';
}

class ReviewScreenArgs {
  const ReviewScreenArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'ReviewScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileScreen extends _i14.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '/profile');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i12.EditProfileScreen]
class EditProfileScreen extends _i14.PageRouteInfo<EditProfileScreenArgs> {
  EditProfileScreen({_i15.Key? key})
      : super(EditProfileScreen.name,
            path: '/edit_profile', args: EditProfileScreenArgs(key: key));

  static const String name = 'EditProfileScreen';
}

class EditProfileScreenArgs {
  const EditProfileScreenArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'EditProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.MyScoresScreen]
class MyScoresScreen extends _i14.PageRouteInfo<MyScoresScreenArgs> {
  MyScoresScreen({_i15.Key? key})
      : super(MyScoresScreen.name,
            path: '/my_scores', args: MyScoresScreenArgs(key: key));

  static const String name = 'MyScoresScreen';
}

class MyScoresScreenArgs {
  const MyScoresScreenArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'MyScoresScreenArgs{key: $key}';
  }
}
