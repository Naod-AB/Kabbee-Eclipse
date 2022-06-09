// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../ui/Screens/Auth/Login/login_screen.dart' as _i2;
import '../ui/Screens/Auth/Signup/signup_onepage.dart' as _i3;
import '../ui/Screens/Category/category_screen.dart' as _i4;
import '../ui/Screens/Category/choose_type_screen.dart' as _i6;
import '../ui/Screens/Category/languages_screen.dart' as _i5;
import '../ui/Screens/Profile/edit_profile_screen.dart' as _i11;
import '../ui/Screens/Profile/my_scores_screen.dart' as _i12;
import '../ui/Screens/Profile/profile_screen.dart' as _i10;
import '../ui/Screens/Question/questions_screen.dart' as _i7;
import '../ui/Screens/Score/final_practice_score.dart' as _i8;
import '../ui/Screens/Score/review_page.dart' as _i9;
import '../ui/Screens/Splash/splash_screen.dart' as _i1;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      final args =
          routeData.argsAs<SplashArgs>(orElse: () => const SplashArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.Splash(key: args.key));
    },
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    OneSignupRoute.name: (routeData) {
      final args = routeData.argsAs<OneSignupRouteArgs>(
          orElse: () => const OneSignupRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.OneSignupPage(key: args.key));
    },
    CategoryRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CategoryPage());
    },
    LanguageChoices.name: (routeData) {
      final args = routeData.argsAs<LanguageChoicesArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.LanguageChoices(key: args.key, courses: args.courses));
    },
    ChooseType.name: (routeData) {
      final args = routeData.argsAs<ChooseTypeArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i6.ChooseType(key: args.key, icon: args.icon, path: args.path));
    },
    QuestionsScreen.name: (routeData) {
      final args = routeData.argsAs<QuestionsScreenArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.QuestionsScreen(
              key: args.key,
              icon: args.icon,
              path: args.path,
              isFinal: args.isFinal));
    },
    FinalScore.name: (routeData) {
      final args = routeData.argsAs<FinalScoreArgs>();
      return _i13.MaterialPageX<dynamic>(
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
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.ReviewScreen(key: args.key));
    },
    ProfileScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ProfileScreen());
    },
    EditProfileScreen.name: (routeData) {
      final args = routeData.argsAs<EditProfileScreenArgs>(
          orElse: () => const EditProfileScreenArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.EditProfileScreen(key: args.key));
    },
    MyScoresScreen.name: (routeData) {
      final args = routeData.argsAs<MyScoresScreenArgs>(
          orElse: () => const MyScoresScreenArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.MyScoresScreen(key: args.key));
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(Splash.name, path: '/'),
        _i13.RouteConfig(LoginRoute.name, path: '/login'),
        _i13.RouteConfig(OneSignupRoute.name, path: '/signup'),
        _i13.RouteConfig(CategoryRoute.name, path: '/category'),
        _i13.RouteConfig(LanguageChoices.name, path: '/language-choices'),
        _i13.RouteConfig(ChooseType.name, path: '/choose-type'),
        _i13.RouteConfig(QuestionsScreen.name, path: '/questions'),
        _i13.RouteConfig(FinalScore.name, path: '/finalScore'),
        _i13.RouteConfig(ReviewScreen.name, path: '/review_screen'),
        _i13.RouteConfig(ProfileScreen.name, path: '/profile'),
        _i13.RouteConfig(EditProfileScreen.name, path: '/edit_profile'),
        _i13.RouteConfig(MyScoresScreen.name, path: '/my_scores')
      ];
}

/// generated route for
/// [_i1.Splash]
class Splash extends _i13.PageRouteInfo<SplashArgs> {
  Splash({_i14.Key? key})
      : super(Splash.name, path: '/', args: SplashArgs(key: key));

  static const String name = 'Splash';
}

class SplashArgs {
  const SplashArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SplashArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.OneSignupPage]
class OneSignupRoute extends _i13.PageRouteInfo<OneSignupRouteArgs> {
  OneSignupRoute({_i14.Key? key})
      : super(OneSignupRoute.name,
            path: '/signup', args: OneSignupRouteArgs(key: key));

  static const String name = 'OneSignupRoute';
}

class OneSignupRouteArgs {
  const OneSignupRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'OneSignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryRoute extends _i13.PageRouteInfo<void> {
  const CategoryRoute() : super(CategoryRoute.name, path: '/category');

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i5.LanguageChoices]
class LanguageChoices extends _i13.PageRouteInfo<LanguageChoicesArgs> {
  LanguageChoices({_i14.Key? key, required dynamic courses})
      : super(LanguageChoices.name,
            path: '/language-choices',
            args: LanguageChoicesArgs(key: key, courses: courses));

  static const String name = 'LanguageChoices';
}

class LanguageChoicesArgs {
  const LanguageChoicesArgs({this.key, required this.courses});

  final _i14.Key? key;

  final dynamic courses;

  @override
  String toString() {
    return 'LanguageChoicesArgs{key: $key, courses: $courses}';
  }
}

/// generated route for
/// [_i6.ChooseType]
class ChooseType extends _i13.PageRouteInfo<ChooseTypeArgs> {
  ChooseType({_i14.Key? key, required dynamic icon, required String path})
      : super(ChooseType.name,
            path: '/choose-type',
            args: ChooseTypeArgs(key: key, icon: icon, path: path));

  static const String name = 'ChooseType';
}

class ChooseTypeArgs {
  const ChooseTypeArgs({this.key, required this.icon, required this.path});

  final _i14.Key? key;

  final dynamic icon;

  final String path;

  @override
  String toString() {
    return 'ChooseTypeArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i7.QuestionsScreen]
class QuestionsScreen extends _i13.PageRouteInfo<QuestionsScreenArgs> {
  QuestionsScreen(
      {_i14.Key? key,
      required dynamic icon,
      required String path,
      required bool isFinal})
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

  final _i14.Key? key;

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
class FinalScore extends _i13.PageRouteInfo<FinalScoreArgs> {
  FinalScore(
      {_i14.Key? key,
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

  final _i14.Key? key;

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
class ReviewScreen extends _i13.PageRouteInfo<ReviewScreenArgs> {
  ReviewScreen({_i14.Key? key})
      : super(ReviewScreen.name,
            path: '/review_screen', args: ReviewScreenArgs(key: key));

  static const String name = 'ReviewScreen';
}

class ReviewScreenArgs {
  const ReviewScreenArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'ReviewScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileScreen extends _i13.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '/profile');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i11.EditProfileScreen]
class EditProfileScreen extends _i13.PageRouteInfo<EditProfileScreenArgs> {
  EditProfileScreen({_i14.Key? key})
      : super(EditProfileScreen.name,
            path: '/edit_profile', args: EditProfileScreenArgs(key: key));

  static const String name = 'EditProfileScreen';
}

class EditProfileScreenArgs {
  const EditProfileScreenArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'EditProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.MyScoresScreen]
class MyScoresScreen extends _i13.PageRouteInfo<MyScoresScreenArgs> {
  MyScoresScreen({_i14.Key? key})
      : super(MyScoresScreen.name,
            path: '/my_scores', args: MyScoresScreenArgs(key: key));

  static const String name = 'MyScoresScreen';
}

class MyScoresScreenArgs {
  const MyScoresScreenArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'MyScoresScreenArgs{key: $key}';
  }
}
