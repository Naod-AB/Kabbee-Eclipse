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
import '../screens/Profile/edit_profile_screen.dart' as _i14;
import '../screens/Profile/my_scores_screen.dart' as _i15;
import '../screens/Profile/profile_screen.dart' as _i13;
import '../screens/question_screen.dart' as _i11;
import '../screens/Score/final_practice_score.dart' as _i12;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Splash());
    },
    LoginRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    SignupEmail.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignupEmail());
    },
    SignupPassword.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignupPassword());
    },
    SignupName.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SignupName());
    },
    CategoryRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CategoryPage());
    },
    FrontEndChoices.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FrontEndChoices());
    },
    BackendChoices.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.BackendChoices());
    },
    CloudChoices.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CloudChoices());
    },
    ChooseType.name: (routeData) {
      final args = routeData.argsAs<ChooseTypeArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.ChooseType(key: args.key, icon: args.icon));
    },
    QuestionScreen.name: (routeData) {
      final args = routeData.argsAs<QuestionScreenArgs>();
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.QuestionScreen(key: args.key, icon: args.icon));
    },
    FinalScore.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.FinalScore());
    },
    ProfileScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ProfileScreen());
    },
    EditProfileScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.EditProfileScreen());
    },
    MyScoresScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.MyScoresScreen());
    }
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(Splash.name, path: '/'),
        _i16.RouteConfig(LoginRoute.name, path: '/login'),
        _i16.RouteConfig(SignupEmail.name, path: '/signup_email'),
        _i16.RouteConfig(SignupPassword.name, path: '/signup_password'),
        _i16.RouteConfig(SignupName.name, path: '/signup_name'),
        _i16.RouteConfig(CategoryRoute.name, path: '/category'),
        _i16.RouteConfig(FrontEndChoices.name, path: '/frontend'),
        _i16.RouteConfig(BackendChoices.name, path: '/backend'),
        _i16.RouteConfig(CloudChoices.name, path: '/cloud'),
        _i16.RouteConfig(ChooseType.name, path: '/choose-type'),
        _i16.RouteConfig(QuestionScreen.name, path: '/questions'),
        _i16.RouteConfig(FinalScore.name, path: '/finalScore'),
        _i16.RouteConfig(ProfileScreen.name, path: '/profile'),
        _i16.RouteConfig(EditProfileScreen.name, path: '/edit_profile'),
        _i16.RouteConfig(MyScoresScreen.name, path: '/my_scores')
      ];
}

/// generated route for
/// [_i1.Splash]
class Splash extends _i16.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: '/');

  static const String name = 'Splash';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SignupEmail]
class SignupEmail extends _i16.PageRouteInfo<void> {
  const SignupEmail() : super(SignupEmail.name, path: '/signup_email');

  static const String name = 'SignupEmail';
}

/// generated route for
/// [_i4.SignupPassword]
class SignupPassword extends _i16.PageRouteInfo<void> {
  const SignupPassword() : super(SignupPassword.name, path: '/signup_password');

  static const String name = 'SignupPassword';
}

/// generated route for
/// [_i5.SignupName]
class SignupName extends _i16.PageRouteInfo<void> {
  const SignupName() : super(SignupName.name, path: '/signup_name');

  static const String name = 'SignupName';
}

/// generated route for
/// [_i6.CategoryPage]
class CategoryRoute extends _i16.PageRouteInfo<void> {
  const CategoryRoute() : super(CategoryRoute.name, path: '/category');

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i7.FrontEndChoices]
class FrontEndChoices extends _i16.PageRouteInfo<void> {
  const FrontEndChoices() : super(FrontEndChoices.name, path: '/frontend');

  static const String name = 'FrontEndChoices';
}

/// generated route for
/// [_i8.BackendChoices]
class BackendChoices extends _i16.PageRouteInfo<void> {
  const BackendChoices() : super(BackendChoices.name, path: '/backend');

  static const String name = 'BackendChoices';
}

/// generated route for
/// [_i9.CloudChoices]
class CloudChoices extends _i16.PageRouteInfo<void> {
  const CloudChoices() : super(CloudChoices.name, path: '/cloud');

  static const String name = 'CloudChoices';
}

/// generated route for
/// [_i10.ChooseType]
class ChooseType extends _i16.PageRouteInfo<ChooseTypeArgs> {
  ChooseType({_i17.Key? key, required dynamic icon})
      : super(ChooseType.name,
            path: '/choose-type', args: ChooseTypeArgs(key: key, icon: icon));

  static const String name = 'ChooseType';
}

class ChooseTypeArgs {
  const ChooseTypeArgs({this.key, required this.icon});

  final _i17.Key? key;

  final dynamic icon;

  @override
  String toString() {
    return 'ChooseTypeArgs{key: $key, icon: $icon}';
  }
}

/// generated route for
/// [_i11.QuestionScreen]
class QuestionScreen extends _i16.PageRouteInfo<QuestionScreenArgs> {
  QuestionScreen({_i17.Key? key, required dynamic icon})
      : super(QuestionScreen.name,
            path: '/questions', args: QuestionScreenArgs(key: key, icon: icon));

  static const String name = 'QuestionScreen';
}

class QuestionScreenArgs {
  const QuestionScreenArgs({this.key, required this.icon});

  final _i17.Key? key;

  final dynamic icon;

  @override
  String toString() {
    return 'QuestionScreenArgs{key: $key, icon: $icon}';
  }
}

/// generated route for
/// [_i12.FinalScore]
class FinalScore extends _i16.PageRouteInfo<void> {
  const FinalScore() : super(FinalScore.name, path: '/finalScore');

  static const String name = 'FinalScore';
}

/// generated route for
/// [_i13.ProfileScreen]
class ProfileScreen extends _i16.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '/profile');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i14.EditProfileScreen]
class EditProfileScreen extends _i16.PageRouteInfo<void> {
  const EditProfileScreen()
      : super(EditProfileScreen.name, path: '/edit_profile');

  static const String name = 'EditProfileScreen';
}

/// generated route for
/// [_i15.MyScoresScreen]
class MyScoresScreen extends _i16.PageRouteInfo<void> {
  const MyScoresScreen() : super(MyScoresScreen.name, path: '/my_scores');

  static const String name = 'MyScoresScreen';
}
