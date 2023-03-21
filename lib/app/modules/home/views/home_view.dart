import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/customs/custom_icon.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}
