import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/customs/custom_icon.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';

import '../controllers/nav_controller.dart';

class NavView extends GetView<NavController> {
  @override
  Widget build(BuildContext context) {
     return Obx(() {
      return Scaffold(
          backgroundColor: AppColors.AppBlack,
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                controller.indexValue.value = index;
              },
              currentIndex: controller.indexValue.value,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey[800],
              selectedItemColor: AppColors.AppWhite,
              unselectedItemColor: AppColors.AppBlack,
              items: [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(
                      Icons.home,
                      size: sizeFit(false, 30, context),
                    )),
                BottomNavigationBarItem(
                    label: 'Search',
                    icon: Icon(
                      Icons.search,
                      size: sizeFit(false, 30, context),
                    )),
                BottomNavigationBarItem(label: '', icon: CustomIcon()),
                BottomNavigationBarItem(
                    label: 'Message',
                    icon: Icon(
                      Icons.message,
                      size: sizeFit(false, 30, context),
                    )),
                BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(
                      Icons.person,
                      size: sizeFit(false, 30, context),
                    )),
              ]),
          body: Obx(
              () => controller.bottomAppScreens[controller.indexValue.value]));
    });
  }
}
