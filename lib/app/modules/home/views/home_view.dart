import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiktok/app/utilities/colors/app_colors.dart';
import 'package:tiktok/app/utilities/customs/custom_icon.dart';
import 'package:tiktok/app/utilities/global/video_player.dart';
import 'package:tiktok/app/utilities/size/size_fit.dart';
import 'package:video_player/video_player.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Obx(() {
      return PageView.builder(
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemCount: controller.videoServices.videoList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                VideoPlayerWidget(
                  videoUrl: controller.videoServices.videoList[index].videoUrl,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeFit(true, 16, context),
                      vertical: sizeFit(false, 8, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller
                                    .videoServices.videoList[index].username,
                                style: TextStyle(
                                    color: AppColors.AppWhite,
                                    fontSize: sizeFit(false, 24, context),
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller
                                        .videoServices.videoList[index].caption,
                                    style: TextStyle(
                                        color: AppColors.AppWhite,
                                        fontSize: sizeFit(false, 16, context),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.music_note,
                                    color: AppColors.AppWhite,
                                    size: sizeFit(false, 12, context),
                                  ),
                                  Text(
                                    controller.videoServices.videoList[index]
                                        .songName,
                                    style: TextStyle(
                                        color: AppColors.AppWhite,
                                        fontSize: sizeFit(false, 16, context),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.AppWhite)),
                                child: CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) {
                                    return CircleAvatar(
                                      radius: 20,
                                      backgroundImage: imageProvider,
                                    );
                                  },
                                  imageUrl: controller.videoServices
                                      .videoList[index].profilePhoto,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: AppColors.AppWhite,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: sizeFit(false, 12, context),
                              ),
                              Icon(
                                CupertinoIcons.heart_fill,
                                color: AppColors.AppWhite,
                                size: sizeFit(false, 30, context),
                              ),
                              SizedBox(
                                height: sizeFit(false, 4, context),
                              ),
                              Text(
                                controller
                                    .videoServices.videoList[index].likes.length
                                    .toString(),
                                style: TextStyle(
                                    color: AppColors.AppWhite,
                                    fontSize: sizeFit(false, 12, context)),
                              ),
                              SizedBox(
                                height: sizeFit(false, 12, context),
                              ),
                              Icon(
                                Icons.comment,
                                color: AppColors.AppWhite,
                                size: sizeFit(false, 30, context),
                              ),
                              SizedBox(
                                height: sizeFit(false, 4, context),
                              ),
                              Text(
                                controller
                                    .videoServices.videoList[index].commentCount
                                    .toString(),
                                style: TextStyle(
                                    color: AppColors.AppWhite,
                                    fontSize: sizeFit(false, 12, context)),
                              ),
                              SizedBox(
                                height: sizeFit(false, 12, context),
                              ),
                              Icon(
                                Icons.reply,
                                color: AppColors.AppWhite,
                                size: sizeFit(false, 30, context),
                              ),
                              SizedBox(
                                height: sizeFit(false, 4, context),
                              ),
                              Text(
                                controller
                                    .videoServices.videoList[index].shareCount
                                    .toString(),
                                style: TextStyle(
                                    color: AppColors.AppWhite,
                                    fontSize: sizeFit(false, 12, context)),
                              ),
                              SizedBox(
                                height: sizeFit(false, 12, context),
                              ),
                              RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(controller.animationController),
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    height: sizeFit(false, 50, context),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [Colors.grey, Colors.white]),
                                    ),
                                    child: CachedNetworkImage(
                                      imageBuilder: (context, imageProvider) {
                                        return CircleAvatar(
                                          radius: 20,
                                          backgroundImage: imageProvider,
                                        );
                                      },
                                      imageUrl: controller.videoServices
                                          .videoList[index].profilePhoto,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        color: AppColors.AppWhite,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          });
    })));
  }
}
