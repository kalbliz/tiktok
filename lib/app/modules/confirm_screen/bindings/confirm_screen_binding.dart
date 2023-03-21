import 'package:get/get.dart';

import '../controllers/confirm_screen_controller.dart';

class ConfirmScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmScreenController>(
      () => ConfirmScreenController(),
    );
  }
}
