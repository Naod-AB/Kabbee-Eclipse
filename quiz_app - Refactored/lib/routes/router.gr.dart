// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../ui/Screens/Auth/Login/login_screen.dart' as _i1;
import '../ui/Screens/Auth/Signup/signup_onepage.dart' as _i2;
import '../ui/Screens/Category/category_screen.dart' as _i3;
import '../ui/Screens/Category/choose_type_screen.dart' as _i5;
import '../ui/Screens/Category/languages_screen.dart' as _i4;
import '../ui/Screens/Profile/edit_profile_screen.dart' as _i10;
import '../ui/Screens/Profile/my_scores_screen.dart' as _i11;
import '../ui/Screens/Profile/profile_screen.dart' as _i9;
import '../ui/Screens/Question/questions_screen.dart' as _i6;
import '../ui/Screens/Score/final_practice_score.dart' as _i7;
import '../ui/Screens/Score/review_page.dart' as _i8;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage());
    },
    OneSignupRoute.name: (routeData) {
      final args = routeData.argsAs<OneSignupRouteArgs>(
          orElse: () => const OneSignupRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.OneSignupPage(key: args.key));
    },
    CategoryRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.CategoryPage());
    },
    LanguageChoices.name: (routeData) {
      final args = routeData.argsAs<LanguageChoicesArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.LanguageChoices(key: args.key, courses: args.courses));
    },
    ChooseType.name: (routeData) {
      final args = routeData.argsAs<ChooseTypeArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i5.ChooseType(key: args.key, icon: args.icon, path: args.path));
    },
    QuestionsScreen.name: (routeData) {
      final args = routeData.argsAs<QuestionsScreenArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.QuestionsScreen(
              key: args.key,
              icon: args.icon,
              path: args.path,
              isFinal: args.isFinal));
    },
    FinalScore.name: (routeData) {
      final args = routeData.argsAs<FinalScoreArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.FinalScore(
              key: args.key,
              outOf: args.outOf,
              score: args.score,
              optionList: args.optionList));
    },
    ReviewScreen.name: (routeData) {
      final args = routeData.argsAs<ReviewScreenArgs>(
          orElse: () => const ReviewScreenArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.ReviewScreen(key: args.key));
    },
    ProfileScreen.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfileScreen());
    },
    EditProfileScreen.name: (routeData) {
      final args = routeData.argsAs<EditProfileScreenArgs>(
          orElse: () => const EditProfileScreenArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.EditProfileScreen(key: args.key));
    },
    MyScoresScreen.name: (routeData) {
      final args = routeData.argsAs<MyScoresScreenArgs>(
          orElse: () => const MyScoresScreenArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.MyScoresScreen(key: args.key));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(LoginRoute.name, path: '/'),
        _i12.RouteConfig(OneSignupRoute.name, path: '/signup'),
        _i12.RouteConfig(CategoryRoute.name, path: '/category'),
        _i12.RouteConfig(LanguageChoices.name, path: '/language-choices'),
        _i12.RouteConfig(ChooseType.name, path: '/choose-type'),
        _i12.RouteConfig(QuestionsScreen.name, path: '/questions'),
        _i12.RouteConfig(FinalScore.name, path: '/finalScore'),
        _i12.RouteConfig(ReviewScreen.name, path: '/review_screen'),
        _i12.RouteConfig(ProfileScreen.name, path: '/profile'),
        _i12.RouteConfig(EditProfileScreen.name, path: '/edit_profile'),
        _i12.RouteConfig(MyScoresScreen.name, path: '/my_scores')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.OneSignupPage]
class OneSignupRoute extends _i12.PageRouteInfo<OneSignupRouteArgs> {
  OneSignupRoute({_i13.Key? key})
      : super(OneSignupRoute.name,
            path: '/signup', args: OneSignupRouteArgs(key: key));

  static const String name = 'OneSignupRoute';
}

class OneSignupRouteArgs {
  const OneSignupRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'OneSignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CategoryPage]
class CategoryRoute extends _i12.PageRouteInfo<void> {
  const CategoryRoute() : super(CategoryRoute.name, path: '/category');

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i4.LanguageChoices]
class LanguageChoices extends _i12.PageRouteInfo<LanguageChoicesArgs> {
  LanguageChoices({_i13.Key? key, required dynamic courses})
      : super(LanguageChoices.name,
            path: '/language-choices',
            args: LanguageChoicesArgs(key: key, courses: courses));

  static const String name = 'LanguageChoices';
}

class LanguageChoicesArgs {
  const LanguageChoicesArgs({this.key, required this.courses});

  final _i13.Key? key;

  final dynamic courses;

  @override
  String toString() {
    return 'LanguageChoicesArgs{key: $key, courses: $courses}';
  }
}

/// generated route for
/// [_i5.ChooseType]
class ChooseType extends _i12.PageRouteInfo<ChooseTypeArgs> {
  ChooseType({_i13.Key? key, required dynamic icon, required String path})
      : super(ChooseType.name,
            path: '/choose-type',
            args: ChooseTypeArgs(key: key, icon: icon, path: path));

  static const String name = 'ChooseType';
}

class ChooseTypeArgs {
  const ChooseTypeArgs({this.key, required this.icon, required this.path});

  final _i13.Key? key;

  final dynamic icon;

  final String path;

  @override
  String toString() {
    return 'ChooseTypeArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i6.QuestionsScreen]
class QuestionsScreen extends _i12.PageRouteInfo<QuestionsScreenArgs> {
  QuestionsScreen(
      {_i13.Key? key,
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

  final _i13.Key? key;

  final dynamic icon;

  final String path;

  final bool isFinal;

  @override
  String toString() {
    return 'QuestionsScreenArgs{key: $key, icon: $icon, path: $path, isFinal: $isFinal}';
  }
}

/// generated route for
/// [_i7.FinalScore]
class FinalScore extends _i12.PageRouteInfo<FinalScoreArgs> {
  FinalScore(
      {_i13.Key? key,
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

  final _i13.Key? key;

  final int outOf;

  final int score;

  final int optionList;

  @override
  String toString() {
    return 'FinalScoreArgs{key: $key, outOf: $outOf, score: $score, optionList: $optionList}';
  }
}

/// generated route for
/// [_i8.ReviewScreen]
class ReviewScreen extends _i12.PageRouteInfo<ReviewScreenArgs> {
  ReviewScreen({_i13.Key? key})
      : super(ReviewScreen.name,
            path: '/review_screen', args: ReviewScreenArgs(key: key));

  static const String name = 'ReviewScreen';
}

class ReviewScreenArgs {
  const ReviewScreenArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ReviewScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileScreen extends _i12.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '/profile');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i10.EditProfileScreen]
class EditProfileScreen extends _i12.PageRouteInfo<EditProfileScreenArgs> {
  EditProfileScreen({_i13.Key? key})
      : super(EditProfileScreen.name,
            path: '/edit_profile', args: EditProfileScreenArgs(key: key));

  static const String name = 'EditProfileScreen';
}

class EditProfileScreenArgs {
  const EditProfileScreenArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'EditProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.MyScoresScreen]
class MyScoresScreen extends _i12.PageRouteInfo<MyScoresScreenArgs> {
  MyScoresScreen({_i13.Key? key})
      : super(MyScoresScreen.name,
            path: '/my_scores', args: MyScoresScreenArgs(key: key));

  static const String name = 'MyScoresScreen';
}

class MyScoresScreenArgs {
  const MyScoresScreenArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'MyScoresScreenArgs{key: $key}';
  }
}
