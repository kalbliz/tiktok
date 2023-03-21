import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/dialogue/options_dialog.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';

import '../controllers/add_post_controller.dart';

class AddPostView extends GetView<AddPostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          showOptionsDialog(context);
        },
        child: Container(
          height: sizeFit(false, 56, context),
          width: sizeFit(true, 200, context),
          color: AppColors.AppRed,
          child: Center(
            child: Text(
              'Add Video',
              style: TextStyle(
                  color: AppColors.AppWhite,
                  fontSize: sizeFit(false, 20, context)),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: sizeFit(true, 16, context),
          ),
        ),
      )),
    );
  }
}
