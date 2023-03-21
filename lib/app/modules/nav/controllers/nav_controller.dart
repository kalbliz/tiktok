import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/modules/add_post/views/add_post_view.dart';
import 'package:tiktok/app/modules/home/views/home_view.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';

class NavController extends GetxController {
  //TODO: Implement NavController
  final indexValue = 0.obs;
  final bottomAppScreens = [].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    bottomAppScreens.add(HomeView());

    bottomAppScreens.add(Center(
      child: Text(
        'Search Screen',
        style: TextStyle(color: AppColors.AppWhite),
      ),
    ));
    bottomAppScreens.add(AddPostView());
    bottomAppScreens.add(Center(
      child: Text(
        'Message Screen',
        style: TextStyle(color: AppColors.AppWhite),
      ),
    ));
    bottomAppScreens.add(Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(color: AppColors.AppWhite),
      ),
    ));
    debugPrint(bottomAppScreens.length.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
