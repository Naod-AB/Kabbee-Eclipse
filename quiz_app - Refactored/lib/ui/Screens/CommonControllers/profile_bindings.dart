import 'package:get/get.dart';
import 'package:quiz_app/ui/Screens/Auth/Controllers/auth_controller.dart';
import 'package:quiz_app/ui/Screens/CommonControllers/question_controller.dart';
import 'profile_controllers.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AuthController>(() => AuthController());
    // Get.lazyPut<ProfileController>(
    //   () => ProfileController(),
    // );
    // Get.lazyPut<QuestionControl>(
    //   () => QuestionControl(),
    // );
  }
}
