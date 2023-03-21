import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreenController extends GetxController {
  //TODO: Implement ConfirmScreenController
  late VideoPlayerController videoPlayerController;
  final TextEditingController songEditingController = TextEditingController();
  final TextEditingController captionEditingController =
      TextEditingController();
  final argument = Get.arguments;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    debugPrint(argument[0]['videoFile'].toString());
    videoPlayerController =
        VideoPlayerController.file(argument[0]['videoFile']);
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setVolume(1);
    videoPlayerController.setLooping(true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
  }

  void increment() => count.value++;
}
