// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../screens/Category/back_end_choices.dart' as _i6;
import '../screens/Category/category_screen.dart' as _i4;
import '../screens/Category/choose_type_screen.dart' as _i8;
import '../screens/Category/cloud_choices.dart' as _i7;
import '../screens/Category/front_end_choices.dart' as _i5;
import '../screens/Login/login_screen.dart' as _i2;
import '../screens/Login/signup_onepage.dart' as _i3;
import '../screens/Login/splash_screen.dart' as _i1;
import '../screens/Profile/edit_profile_screen.dart' as _i15;
import '../screens/Profile/my_scores_screen.dart' as _i16;
import '../screens/Profile/profile_screen.dart' as _i14;
import '../screens/question_screen.dart' as _i9;
import '../screens/Score/evalu_screen.dart' as _i10;
//import '../screens/Score/evaluationscore_screen.dart' as _i12;
import '../screens/Score/final_practice_score.dart' as _i11;
import '../screens/Score/review_page.dart' as _i13;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Splash());
    },
    LoginRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    OneSignupRoute.name: (routeData) {
      final args = routeData.argsAs<OneSignupRouteArgs>(
          orElse: () => const OneSignupRouteArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.OneSignupPage(key: args.key));
    },
    CategoryRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CategoryPage());
    },
    FrontEndChoices.name: (routeData) {
      final args = routeData.argsAs<FrontEndChoicesArgs>(
          orElse: () => const FrontEndChoicesArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.FrontEndChoices(key: args.key));
    },
    BackendChoices.name: (routeData) {
      final args = routeData.argsAs<BackendChoicesArgs>(
          orElse: () => const BackendChoicesArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.BackendChoices(key: args.key));
    },
    CloudChoices.name: (routeData) {
      final args = routeData.argsAs<CloudChoicesArgs>(
          orElse: () => const CloudChoicesArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.CloudChoices(key: args.key));
    },
    ChooseType.name: (routeData) {
      final args = routeData.argsAs<ChooseTypeArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i8.ChooseType(key: args.key, icon: args.icon, path: args.path));
    },
    QuestionScreen.name: (routeData) {
      final args = routeData.argsAs<QuestionScreenArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.QuestionScreen(
              key: args.key, icon: args.icon, path: args.path));
    },
    EvaluationScreens.name: (routeData) {
      final args = routeData.argsAs<EvaluationScreensArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.evaluationScreens(
              key: args.key, icon: args.icon, path: args.path));
    },
    FinalScore.name: (routeData) {
      final args = routeData.argsAs<FinalScoreArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.FinalScore(
              key: args.key,
              outOf: args.outOf,
              score: args.score,
              optionList: args.optionList));
    },
    // ExamScore.name: (routeData) {
    //   final args = routeData.argsAs<ExamScoreArgs>();
    //   return _i17.MaterialPageX<dynamic>(
    //       routeData: routeData,
    //       child: _i12.ExamScore(
    //           key: args.key, outOf: args.outOf, score: args.score));
    // },
    ReviewScreen.name: (routeData) {
      final args = routeData.argsAs<ReviewScreenArgs>(
          orElse: () => const ReviewScreenArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.ReviewScreen(key: args.key));
    },
    ProfileScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ProfileScreen());
    },
    EditProfileScreen.name: (routeData) {
      final args = routeData.argsAs<EditProfileScreenArgs>(
          orElse: () => const EditProfileScreenArgs());
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: _i15.EditProfileScreen(key: args.key));
    },
    MyScoresScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child:  _i16.MyScoresScreen());
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(Splash.name, path: '/'),
        _i17.RouteConfig(LoginRoute.name, path: '/login'),
        _i17.RouteConfig(OneSignupRoute.name, path: '/signup'),
        _i17.RouteConfig(CategoryRoute.name, path: '/category'),
        _i17.RouteConfig(FrontEndChoices.name, path: '/frontend'),
        _i17.RouteConfig(BackendChoices.name, path: '/backend'),
        _i17.RouteConfig(CloudChoices.name, path: '/cloud'),
        _i17.RouteConfig(ChooseType.name, path: '/choose-type'),
        _i17.RouteConfig(QuestionScreen.name, path: '/questions'),
        _i17.RouteConfig(EvaluationScreens.name, path: '/evaluation'),
        _i17.RouteConfig(FinalScore.name, path: '/finalScore'),
        _i17.RouteConfig(ExamScore.name, path: '/ExamScore'),
        _i17.RouteConfig(ReviewScreen.name, path: '/review_screen'),
        _i17.RouteConfig(ProfileScreen.name, path: '/profile'),
        _i17.RouteConfig(EditProfileScreen.name, path: '/edit_profile'),
        _i17.RouteConfig(MyScoresScreen.name, path: '/my_scores')
      ];
}

/// generated route for
/// [_i1.Splash]
class Splash extends _i17.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: '/');

  static const String name = 'Splash';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.OneSignupPage]
class OneSignupRoute extends _i17.PageRouteInfo<OneSignupRouteArgs> {
  OneSignupRoute({_i18.Key? key})
      : super(OneSignupRoute.name,
            path: '/signup', args: OneSignupRouteArgs(key: key));

  static const String name = 'OneSignupRoute';
}

class OneSignupRouteArgs {
  const OneSignupRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'OneSignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryRoute extends _i17.PageRouteInfo<void> {
  const CategoryRoute() : super(CategoryRoute.name, path: '/category');

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i5.FrontEndChoices]
class FrontEndChoices extends _i17.PageRouteInfo<FrontEndChoicesArgs> {
  FrontEndChoices({_i18.Key? key})
      : super(FrontEndChoices.name,
            path: '/frontend', args: FrontEndChoicesArgs(key: key));

  static const String name = 'FrontEndChoices';
}

class FrontEndChoicesArgs {
  const FrontEndChoicesArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'FrontEndChoicesArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.BackendChoices]
class BackendChoices extends _i17.PageRouteInfo<BackendChoicesArgs> {
  BackendChoices({_i18.Key? key})
      : super(BackendChoices.name,
            path: '/backend', args: BackendChoicesArgs(key: key));

  static const String name = 'BackendChoices';
}

class BackendChoicesArgs {
  const BackendChoicesArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'BackendChoicesArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.CloudChoices]
class CloudChoices extends _i17.PageRouteInfo<CloudChoicesArgs> {
  CloudChoices({_i18.Key? key})
      : super(CloudChoices.name,
            path: '/cloud', args: CloudChoicesArgs(key: key));

  static const String name = 'CloudChoices';
}

class CloudChoicesArgs {
  const CloudChoicesArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'CloudChoicesArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ChooseType]
class ChooseType extends _i17.PageRouteInfo<ChooseTypeArgs> {
  ChooseType({_i18.Key? key, required dynamic icon, required String path})
      : super(ChooseType.name,
            path: '/choose-type',
            args: ChooseTypeArgs(key: key, icon: icon, path: path));

  static const String name = 'ChooseType';
}

class ChooseTypeArgs {
  const ChooseTypeArgs({this.key, required this.icon, required this.path});

  final _i18.Key? key;

  final dynamic icon;

  final String path;

  @override
  String toString() {
    return 'ChooseTypeArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i9.QuestionScreen]
class QuestionScreen extends _i17.PageRouteInfo<QuestionScreenArgs> {
  QuestionScreen({_i18.Key? key, required dynamic icon, required String path})
      : super(QuestionScreen.name,
            path: '/questions',
            args: QuestionScreenArgs(key: key, icon: icon, path: path));

  static const String name = 'QuestionScreen';
}

class QuestionScreenArgs {
  const QuestionScreenArgs({this.key, required this.icon, required this.path});

  final _i18.Key? key;

  final dynamic icon;

  final String path;

  @override
  String toString() {
    return 'QuestionScreenArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i10.evaluationScreens]
class EvaluationScreens extends _i17.PageRouteInfo<EvaluationScreensArgs> {
  EvaluationScreens(
      {_i18.Key? key, required dynamic icon, required String path})
      : super(EvaluationScreens.name,
            path: '/evaluation',
            args: EvaluationScreensArgs(key: key, icon: icon, path: path));

  static const String name = 'EvaluationScreens';
}

class EvaluationScreensArgs {
  const EvaluationScreensArgs(
      {this.key, required this.icon, required this.path});

  final _i18.Key? key;

  final dynamic icon;

  final String path;

  @override
  String toString() {
    return 'EvaluationScreensArgs{key: $key, icon: $icon, path: $path}';
  }
}

/// generated route for
/// [_i11.FinalScore]
class FinalScore extends _i17.PageRouteInfo<FinalScoreArgs> {
  FinalScore(
      {_i18.Key? key,
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

  final _i18.Key? key;

  final int outOf;

  final int score;

  final int optionList;

  @override
  String toString() {
    return 'FinalScoreArgs{key: $key, outOf: $outOf, score: $score, optionList: $optionList}';
  }
}

/// generated route for
/// [_i12.ExamScore]
class ExamScore extends _i17.PageRouteInfo<ExamScoreArgs> {
  ExamScore({_i18.Key? key, required int outOf, required int score})
      : super(ExamScore.name,
            path: '/ExamScore',
            args: ExamScoreArgs(key: key, outOf: outOf, score: score));

  static const String name = 'ExamScore';
}

class ExamScoreArgs {
  const ExamScoreArgs({this.key, required this.outOf, required this.score});

  final _i18.Key? key;

  final int outOf;

  final int score;

  @override
  String toString() {
    return 'ExamScoreArgs{key: $key, outOf: $outOf, score: $score}';
  }
}

/// generated route for
/// [_i13.ReviewScreen]
class ReviewScreen extends _i17.PageRouteInfo<ReviewScreenArgs> {
  ReviewScreen({_i18.Key? key})
      : super(ReviewScreen.name,
            path: '/review_screen', args: ReviewScreenArgs(key: key));

  static const String name = 'ReviewScreen';
}

class ReviewScreenArgs {
  const ReviewScreenArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'ReviewScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.ProfileScreen]
class ProfileScreen extends _i17.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '/profile');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i15.EditProfileScreen]
class EditProfileScreen extends _i17.PageRouteInfo<EditProfileScreenArgs> {
  EditProfileScreen({_i18.Key? key})
      : super(EditProfileScreen.name,
            path: '/edit_profile', args: EditProfileScreenArgs(key: key));

  static const String name = 'EditProfileScreen';
}

class EditProfileScreenArgs {
  const EditProfileScreenArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'EditProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.MyScoresScreen]
class MyScoresScreen extends _i17.PageRouteInfo<void> {
  const MyScoresScreen() : super(MyScoresScreen.name, path: '/my_scores');

  static const String name = 'MyScoresScreen';
}
