import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/services/videos_services.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  // late VideoPlayerController videoPlayerController;
  final count = 0.obs;
  final videoIndex = 0.obs;
  final argument = Get.arguments;
  late AnimationController animationController;
  final videoServices = Get.find<VideoServices>();
  @override
  void onInit() async {
    super.onInit();
    debugPrint(videoServices.videoList.length.toString());
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    animationController.forward();
    animationController.repeat();
    // videoPlayerController = VideoPlayerController.network(
    //     videoServices.videoList.elementAt(videoIndex.value).videoUrl)
    //   ..initialize().then((value) {
    //     videoPlayerController.play();
    //     videoPlayerController.setVolume(1);
    //   });
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // videoPlayerController.dispose();
    animationController.dispose();
   
  }

  void increment() => count.value++;
}
