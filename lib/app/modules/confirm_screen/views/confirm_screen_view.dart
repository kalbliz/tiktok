import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/enums/enums.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';
import 'package:tiktok/app/utilities/text_field/tik_textfield.dart';
import 'package:video_player/video_player.dart';

import '../controllers/confirm_screen_controller.dart';

class ConfirmScreenView extends GetView<ConfirmScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return controller.thisViewState.value == ViewState.busy
          ? Center(
              child: CircularProgressIndicator(strokeWidth: 0.5),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: sizeFit(false, 30, context),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: VideoPlayer(controller.videoPlayerController),
                  ),
                  SizedBox(
                    height: sizeFit(false, 30, context),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: sizeFit(true, 10, context)),
                          width: MediaQuery.of(context).size.width - 20,
                          child: TikTextField(
                            hintText: 'Song Name',
                            enabled: true,
                            textEditingController:
                                controller.songEditingController,
                            prefixIcon: Icon(Icons.music_note),
                          ),
                        ),
                        SizedBox(
                          height: sizeFit(false, 10, context),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: sizeFit(true, 10, context)),
                          width: MediaQuery.of(context).size.width - 20,
                          child: TikTextField(
                            hintText: 'Caption',
                            enabled: true,
                            textEditingController:
                                controller.captionEditingController,
                            prefixIcon: Icon(Icons.closed_caption),
                          ),
                        ),
                        SizedBox(
                          height: sizeFit(false, 10, context),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await controller.uploadVideo(
                                  songName:
                                      controller.songEditingController.text,
                                  caption:
                                      controller.captionEditingController.text,
                                  videoPath: controller.argument[0]['videoPath']
                                      .toString());
                              // controller.compressVideo(
                              //     videoPath: controller.argument[0]['videoPath']
                              //         .toString());
                            },
                            child: Text(
                              'Share',
                              style: TextStyle(
                                  color: AppColors.AppWhite,
                                  fontSize: sizeFit(false, 22, context)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            );
    }));
  }
}
