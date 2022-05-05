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

import '../screens/Category/back_end_choices.dart' as _i8;
import '../screens/Category/category_screen.dart' as _i6;
import '../screens/Category/choose_type_screen.dart' as _i10;
import '../screens/Category/cloud_choices.dart' as _i9;
import '../screens/Category/front_end_choices.dart' as _i7;
import '../screens/Login/login_screen.dart' as _i2;
import '../screens/Login/signup_email.dart' as _i3;
import '../screens/Login/signup_name.dart' as _i5;
import '../screens/Login/signUp_password.dart' as _i4;
import '../screens/Login/splash_screen.dart' as _i1;
import '../screens/Profile/edit_profile_screen.dart' as _i15;
import '../screens/Profile/my_scores_screen.dart' as _i16;
import '../screens/Profile/profile_screen.dart' as _i14;
import '../screens/question_screen.dart' as _i11;
import '../screens/Score/final_practice_score.dart' as _i12;
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
    SignupEmail.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignupEmail());
    },
    SignupPassword.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignupPassword());
    },
    SignupName.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SignupName());
    },
    CategoryRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CategoryPage());
    },
    FrontEndChoices.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FrontEndChoices());
    },
    BackendChoices.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.BackendChoices());
    },
    CloudChoices.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CloudChoices());
    },
    ChooseType.name: (routeData) {
      final args = routeData.argsAs<ChooseTypeArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.ChooseType(key: args.key, icon: args.icon));
    },
    QuestionScreen.name: (routeData) {
      final args = routeData.argsAs<QuestionScreenArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.QuestionScreen(key: args.key, icon: args.icon));
    },
    FinalScore.name: (routeData) {
      final args = routeData.argsAs<FinalScoreArgs>();
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.FinalScore(
              key: args.key, outOf: args.outOf, score: args.score));
    },
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
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.EditProfileScreen());
    },
    MyScoresScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.MyScoresScreen());
    }
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(Splash.name, path: '/'),
        _i17.RouteConfig(LoginRoute.name, path: '/login'),
        _i17.RouteConfig(SignupEmail.name, path: '/signup_email'),
        _i17.RouteConfig(SignupPassword.name, path: '/signup_password'),
        _i17.RouteConfig(SignupName.name, path: '/signup_name'),
        _i17.RouteConfig(CategoryRoute.name, path: '/category'),
        _i17.RouteConfig(FrontEndChoices.name, path: '/frontend'),
        _i17.RouteConfig(BackendChoices.name, path: '/backend'),
        _i17.RouteConfig(CloudChoices.name, path: '/cloud'),
        _i17.RouteConfig(ChooseType.name, path: '/choose-type'),
        _i17.RouteConfig(QuestionScreen.name, path: '/questions'),
        _i17.RouteConfig(FinalScore.name, path: '/finalScore'),
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
/// [_i3.SignupEmail]
class SignupEmail extends _i17.PageRouteInfo<void> {
  const SignupEmail() : super(SignupEmail.name, path: '/signup_email');

  static const String name = 'SignupEmail';
}

/// generated route for
/// [_i4.SignupPassword]
class SignupPassword extends _i17.PageRouteInfo<void> {
  const SignupPassword() : super(SignupPassword.name, path: '/signup_password');

  static const String name = 'SignupPassword';
}

/// generated route for
/// [_i5.SignupName]
class SignupName extends _i17.PageRouteInfo<void> {
  const SignupName() : super(SignupName.name, path: '/signup_name');

  static const String name = 'SignupName';
}

/// generated route for
/// [_i6.CategoryPage]
class CategoryRoute extends _i17.PageRouteInfo<void> {
  const CategoryRoute() : super(CategoryRoute.name, path: '/category');

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i7.FrontEndChoices]
class FrontEndChoices extends _i17.PageRouteInfo<void> {
  const FrontEndChoices() : super(FrontEndChoices.name, path: '/frontend');

  static const String name = 'FrontEndChoices';
}

/// generated route for
/// [_i8.BackendChoices]
class BackendChoices extends _i17.PageRouteInfo<void> {
  const BackendChoices() : super(BackendChoices.name, path: '/backend');

  static const String name = 'BackendChoices';
}

/// generated route for
/// [_i9.CloudChoices]
class CloudChoices extends _i17.PageRouteInfo<void> {
  const CloudChoices() : super(CloudChoices.name, path: '/cloud');

  static const String name = 'CloudChoices';
}

/// generated route for
/// [_i10.ChooseType]
class ChooseType extends _i17.PageRouteInfo<ChooseTypeArgs> {
  ChooseType({_i18.Key? key, required dynamic icon})
      : super(ChooseType.name,
            path: '/choose-type', args: ChooseTypeArgs(key: key, icon: icon));

  static const String name = 'ChooseType';
}

class ChooseTypeArgs {
  const ChooseTypeArgs({this.key, required this.icon});

  final _i18.Key? key;

  final dynamic icon;

  @override
  String toString() {
    return 'ChooseTypeArgs{key: $key, icon: $icon}';
  }
}

/// generated route for
/// [_i11.QuestionScreen]
class QuestionScreen extends _i17.PageRouteInfo<QuestionScreenArgs> {
  QuestionScreen({_i18.Key? key, required dynamic icon})
      : super(QuestionScreen.name,
            path: '/questions', args: QuestionScreenArgs(key: key, icon: icon));

  static const String name = 'QuestionScreen';
}

class QuestionScreenArgs {
  const QuestionScreenArgs({this.key, required this.icon});

  final _i18.Key? key;

  final dynamic icon;

  @override
  String toString() {
    return 'QuestionScreenArgs{key: $key, icon: $icon}';
  }
}

/// generated route for
/// [_i12.FinalScore]
class FinalScore extends _i17.PageRouteInfo<FinalScoreArgs> {
  FinalScore({_i18.Key? key, required int outOf, required int score})
      : super(FinalScore.name,
            path: '/finalScore',
            args: FinalScoreArgs(key: key, outOf: outOf, score: score));

  static const String name = 'FinalScore';
}

class FinalScoreArgs {
  const FinalScoreArgs({this.key, required this.outOf, required this.score});

  final _i18.Key? key;

  final int outOf;

  final int score;

  @override
  String toString() {
    return 'FinalScoreArgs{key: $key, outOf: $outOf, score: $score}';
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
class EditProfileScreen extends _i17.PageRouteInfo<void> {
  const EditProfileScreen()
      : super(EditProfileScreen.name, path: '/edit_profile');

  static const String name = 'EditProfileScreen';
}

/// generated route for
/// [_i16.MyScoresScreen]
class MyScoresScreen extends _i17.PageRouteInfo<void> {
  const MyScoresScreen() : super(MyScoresScreen.name, path: '/my_scores');

  static const String name = 'MyScoresScreen';
}
