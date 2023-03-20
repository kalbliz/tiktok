import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';

class GeneralDialog {
  Future<dynamic> circularLoader() {
    return Get.dialog(
      WillPopScope(
        onWillPop: () async => true,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: sizeFit(true, 0.5, Get.context!),
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.AppGreen),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future<dynamic> errorMessage(
    String message,
  ) async {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        elevation: 3,
        alignment: Alignment.center,
        backgroundColor: AppColors.AppBlack,
        title: Text(
          'Error!!',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.AppRed,
              fontFamily: "Cabin",
              fontWeight: FontWeight.w800,
              fontSize: sizeFit(false, 36, context)),
        ),
        content: Text(
          message.capitalizeFirst!,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Cabin",
              color: AppColors.AppWhite,
              fontSize: sizeFit(false, 18, context),
              fontWeight: FontWeight.w400),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeFit(true, 24, context),
                  vertical: sizeFit(false, 14, context)),
              decoration: BoxDecoration(
                color: AppColors.AppWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Dismiss',
                style: TextStyle(
                    color: AppColors.AppWhite,
                    fontSize: sizeFit(false, 16, context),
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> successMessage(String title, String message) {
    return Get.defaultDialog(
      // onWillPop: () async => false,
      backgroundColor: AppColors.AppBlack,
      title: title.capitalizeFirst!,
      titleStyle: TextStyle(
        color: AppColors.AppGreen,
        fontFamily: "DMSans",
      ),
      content: Text(
        message.capitalizeFirst!,
        textAlign: TextAlign.center,
        //  TODO: Add styling for errors.
        style: TextStyle(
          color: AppColors.AppWhite,
          fontFamily: "DMSans",
        ),
      ),
      titlePadding: const EdgeInsets.all(8.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
    );
  }
}
