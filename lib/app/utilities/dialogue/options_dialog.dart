import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/app/routes/app_routes.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';

showOptionsDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () {
                  pickVideo(ImageSource.gallery, context);
                },
                child: Row(children: [
                  Icon(Icons.image),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Gallery',
                      style: TextStyle(fontSize: sizeFit(false, 20, context)),
                    ),
                  ),
                ]),
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickVideo(ImageSource.camera, context);
                },
                child: Row(children: [
                  Icon(Icons.camera),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Camera',
                      style: TextStyle(fontSize: sizeFit(false, 20, context)),
                    ),
                  ),
                ]),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: Row(children: [
                  Icon(Icons.close),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: sizeFit(false, 20, context)),
                    ),
                  ),
                ]),
              ),
            ],
          ));
}

pickVideo(ImageSource source, BuildContext context) async {
  final video = await ImagePicker().pickVideo(source: source);
  if (video != null) {
    Get.toNamed(AppRoutes.CONFIRM_SCREEN, arguments: [
      {"videoFile": File(video.path), "videoPath": video.path}
    ]);
  }
}
