import 'package:get/get.dart';
import 'package:tiktok/app/modules/authentication/controllers/login_controller.dart';
import 'package:tiktok/app/modules/authentication/controllers/signup_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
   
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    
  }
}
