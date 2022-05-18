// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../screens/Category/back_end_choices.dart' as _i6;
import '../screens/Category/category_screen.dart' as _i4;
import '../screens/Category/choose_type_screen.dart' as _i8;
import '../screens/Category/cloud_choices.dart' as _i7;
import '../screens/Category/front_end_choices.dart' as _i5;
import '../screens/Login/login_screen.dart' as _i2;
import '../screens/Login/signup_onepage.dart' as _i3;
import '../screens/Login/splash_screen.dart' as _i1;
import '../screens/Profile/edit_profile_screen.dart' as _i13;
import '../screens/Profile/my_scores_screen.dart' as _i14;
import '../screens/Profile/profile_screen.dart' as _i12;
import '../screens/question_screen.dart' as _i9;
import '../screens/Score/evalu_screen.dart' as _i17; // add evaluation screen
import '../screens/Score/final_practice_score.dart' as _i10;
import '../screens/Score/review_page.dart' as _i11;
import '../screens/Score/evaluationscore_screen.dart' as _i118;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Splash());
    },
    LoginRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    OneSignupRoute.name: (routeData) {
      final args = routeData.argsAs<OneSignupRouteArgs>(
          orElse: () => const OneSignupRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.OneSignupPage(key: args.key));
    },
    CategoryRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CategoryPage());
    },
    FrontEndChoices.name: (routeData) {
      final args = routeData.argsAs<FrontEndChoicesArgs>(
          orElse: () => const FrontEndChoicesArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.FrontEndChoices(key: args.key));
    },
    BackendChoices.name: (routeData) {
      final args = routeData.argsAs<BackendChoicesArgs>(
          orElse: () => const BackendChoicesArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.BackendChoices(key: args.key));
    },
    CloudChoices.name: (routeData) {
      final args = routeData.argsAs<CloudChoicesArgs>(
          orElse: () => const CloudChoicesArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.CloudChoices(key: args.key));
    },
    ChooseType.name: (routeData) {
      final args = routeData.argsAs<ChooseTypeArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.ChooseType(key: args.key, icon: args.icon));
    },
    QuestionScreen.name: (routeData) {
      final args = routeData.argsAs<QuestionScreenArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.QuestionScreen(key: args.key, icon: args.icon));
    },
    FinalScore.name: (routeData) {
      final args = routeData.argsAs<FinalScoreArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.FinalScore(
              key: args.key, outOf: args.outOf, score: args.score));
    },
    ReviewScreen.name: (routeData) {
      final args = routeData.argsAs<ReviewScreenArgs>(
          orElse: () => const ReviewScreenArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.ReviewScreen(key: args.key));
    },
    ProfileScreen.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ProfileScreen());
    },
    EditProfileScreen.name: (routeData) {
      final args = routeData.argsAs<EditProfileScreenArgs>(
          orElse: () => const EditProfileScreenArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.EditProfileScreen(key: args.key));
    },
    MyScoresScreen.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.MyScoresScreen());
    },
    ExamScoresScreen.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.MyScoresScreen());
    },
    // add evaluation screen
    evaluationScreen.name: (routeData) {
      final args = routeData.argsAs<evaluationScreenArgs>();
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.evaluationScreens(key: args.key, icon: args.icon));
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(Splash.name, path: '/'),
        _i15.RouteConfig(LoginRoute.name, path: '/login'),
        _i15.RouteConfig(OneSignupRoute.name, path: '/signup'),
        _i15.RouteConfig(CategoryRoute.name, path: '/category'),
        _i15.RouteConfig(FrontEndChoices.name, path: '/frontend'),
        _i15.RouteConfig(BackendChoices.name, path: '/backend'),
        _i15.RouteConfig(CloudChoices.name, path: '/cloud'),
        _i15.RouteConfig(ChooseType.name, path: '/choose-type'),
        _i15.RouteConfig(QuestionScreen.name, path: '/questions'),
        _i15.RouteConfig(evaluationScreen.name,
            path: '/evaluation'), // add evaluation screen
        _i15.RouteConfig(FinalScore.name, path: '/finalScore'),
        _i15.RouteConfig(ReviewScreen.name, path: '/review_screen'),
        _i15.RouteConfig(ProfileScreen.name, path: '/profile'),
        _i15.RouteConfig(EditProfileScreen.name, path: '/edit_profile'),
        _i15.RouteConfig(MyScoresScreen.name, path: '/my_scores'),
        _i15.RouteConfig(ExamScoresScreen.name, path: '/Exam_scores'),
      ];
}

/// generated route for
/// [_i1.Splash]
class Splash extends _i15.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: '/');

  static const String name = 'Splash';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.OneSignupPage]
class OneSignupRoute extends _i15.PageRouteInfo<OneSignupRouteArgs> {
  OneSignupRoute({_i16.Key? key})
      : super(OneSignupRoute.name,
            path: '/signup', args: OneSignupRouteArgs(key: key));

  static const String name = 'OneSignupRoute';
}

class OneSignupRouteArgs {
  const OneSignupRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'OneSignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CategoryPage]
class CategoryRoute extends _i15.PageRouteInfo<void> {
  const CategoryRoute() : super(CategoryRoute.name, path: '/category');

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i5.FrontEndChoices]
class FrontEndChoices extends _i15.PageRouteInfo<FrontEndChoicesArgs> {
  FrontEndChoices({_i16.Key? key})
      : super(FrontEndChoices.name,
            path: '/frontend', args: FrontEndChoicesArgs(key: key));

  static const String name = 'FrontEndChoices';
}

class FrontEndChoicesArgs {
  const FrontEndChoicesArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'FrontEndChoicesArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.BackendChoices]
class BackendChoices extends _i15.PageRouteInfo<BackendChoicesArgs> {
  BackendChoices({_i16.Key? key})
      : super(BackendChoices.name,
            path: '/backend', args: BackendChoicesArgs(key: key));

  static const String name = 'BackendChoices';
}

class BackendChoicesArgs {
  const BackendChoicesArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'BackendChoicesArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.CloudChoices]
class CloudChoices extends _i15.PageRouteInfo<CloudChoicesArgs> {
  CloudChoices({_i16.Key? key})
      : super(CloudChoices.name,
            path: '/cloud', args: CloudChoicesArgs(key: key));

  static const String name = 'CloudChoices';
}

class CloudChoicesArgs {
  const CloudChoicesArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'CloudChoicesArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ChooseType]
class ChooseType extends _i15.PageRouteInfo<ChooseTypeArgs> {
  ChooseType({_i16.Key? key, required dynamic icon})
      : super(ChooseType.name,
            path: '/choose-type', args: ChooseTypeArgs(key: key, icon: icon));

  static const String name = 'ChooseType';
}

class ChooseTypeArgs {
  const ChooseTypeArgs({this.key, required this.icon});

  final _i16.Key? key;

  final dynamic icon;

  @override
  String toString() {
    return 'ChooseTypeArgs{key: $key, icon: $icon}';
  }
}

/// generated route for
/// [_i9.QuestionScreen]
class QuestionScreen extends _i15.PageRouteInfo<QuestionScreenArgs> {
  QuestionScreen({_i16.Key? key, required dynamic icon})
      : super(QuestionScreen.name,
            path: '/questions', args: QuestionScreenArgs(key: key, icon: icon));

  static const String name = 'QuestionScreen';
}

class QuestionScreenArgs {
  const QuestionScreenArgs({this.key, required this.icon});

  final _i16.Key? key;

  final dynamic icon;

  @override
  String toString() {
    return 'QuestionScreenArgs{key: $key, icon: $icon}';
  }
}

/// generated route for
/// [_i10.FinalScore]
class FinalScore extends _i15.PageRouteInfo<FinalScoreArgs> {
  FinalScore({_i16.Key? key, required int outOf, required int score})
      : super(FinalScore.name,
            path: '/finalScore',
            args: FinalScoreArgs(key: key, outOf: outOf, score: score));

  static const String name = 'FinalScore';
}

class FinalScoreArgs {
  const FinalScoreArgs({this.key, required this.outOf, required this.score});

  final _i16.Key? key;

  final int outOf;

  final int score;

  @override
  String toString() {
    return 'FinalScoreArgs{key: $key, outOf: $outOf, score: $score}';
  }
}

/// exam score screen
/// generated route for
/// [_i118.ExamScore]
class ExamScore extends _i15.PageRouteInfo<ExamScoreArgs> {
  ExamScore({_i16.Key? key, required int outOf, required int score})
      : super(ExamScore.name,
            path: '/ExamScore',
            args: ExamScoreArgs(key: key, outOf: outOf, score: score));

  static const String name = 'ExamScore';
}

class ExamScoreArgs {
  const ExamScoreArgs({this.key, required this.outOf, required this.score});

  final _i16.Key? key;

  final int outOf;

  final int score;

  @override
  String toString() {
    return 'ExamScoreArgs{key: $key, outOf: $outOf, score: $score}';
  }
}

/// generated route for
/// [_i11.ReviewScreen]
class ReviewScreen extends _i15.PageRouteInfo<ReviewScreenArgs> {
  ReviewScreen({_i16.Key? key})
      : super(ReviewScreen.name,
            path: '/review_screen', args: ReviewScreenArgs(key: key));

  static const String name = 'ReviewScreen';
}

class ReviewScreenArgs {
  const ReviewScreenArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'ReviewScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileScreen extends _i15.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '/profile');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i13.EditProfileScreen]
class EditProfileScreen extends _i15.PageRouteInfo<EditProfileScreenArgs> {
  EditProfileScreen({_i16.Key? key})
      : super(EditProfileScreen.name,
            path: '/edit_profile', args: EditProfileScreenArgs(key: key));

  static const String name = 'EditProfileScreen';
}

class EditProfileScreenArgs {
  const EditProfileScreenArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'EditProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.MyScoresScreen]
class MyScoresScreen extends _i15.PageRouteInfo<void> {
  const MyScoresScreen() : super(MyScoresScreen.name, path: '/my_scores');

  static const String name = 'MyScoresScreen';
}

/// exam score class

/// generated route for
/// [_i14.MyScoresScreen]
class ExamScoresScreen extends _i15.PageRouteInfo<void> {
  const ExamScoresScreen() : super(ExamScoresScreen.name, path: '/Exam_scores');

  static const String name = 'ExamScoresScreen';
}

// add evaluation screen
/// generated route for
/// [_i17.evaluationScreens]
class evaluationScreen extends _i15.PageRouteInfo<evaluationScreenArgs> {
  evaluationScreen({_i16.Key? key, required dynamic icon})
      : super(evaluationScreen.name,
            path: '/evaluation',
            args: evaluationScreenArgs(key: key, icon: icon));

  static const String name = 'evaluationScreen';
}

class evaluationScreenArgs {
  const evaluationScreenArgs({this.key, required this.icon});

  final _i16.Key? key;

  final dynamic icon;

  @override
  String toString() {
    return 'evaluationScreenArgs{key: $key, icon: $icon}';
  }
}
