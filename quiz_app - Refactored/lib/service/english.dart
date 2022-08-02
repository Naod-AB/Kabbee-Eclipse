import 'package:get/get.dart';

import 'ti.dart';

class translate extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': usEnglish,
        'tig_ER': tigrinya,
      };
}

const Map<String, String> usEnglish = {
  'login': 'Login',
  'enter email': 'Enter Email',
  'create_account': 'Create Account',
  'remember_me': 'Remember Me',
  'enter password': 'Enter Password',
  'don`t have an account': 'Don`t have an account',
  'sign up': 'Sign up',
  'select language': 'Select Language',
  //'create_account': 'Create account',
  // 'remember_me': 'Remember me',
//'create_account':'Create_Account',
  "select_category": "Select category",
  'front_end': 'Front End',
  "cloud_service": "Cloud service",
  "back_end": "Back end",
  "select_type": "Select type",
  "practice_test": "Practice test",
  'your_score': 'Your score',
  'review': 'Review',
  'done': 'Done',
  "select_language": "Select language",
  'edit_profile': 'Edit profile',
  "evalution_exam": "Evalution exam",
  'dashboard': 'Dashboard',
  'users': 'Users',
  'active': 'Active',
  'blocked': 'Blocked',
};
