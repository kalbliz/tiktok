import 'package:get/get.dart';
import 'package:tiktok/app/modules/add_post/controllers/add_post_controller.dart';
import 'package:tiktok/app/modules/home/controllers/home_controller.dart';
import 'package:tiktok/app/modules/profile/controllers/profile_controller.dart';
import 'package:tiktok/app/modules/search/controllers/search_controller.dart';
import 'package:tiktok/app/modules/message/controllers/video_screens_controller.dart';

import '../controllers/nav_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(
      () => NavController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<AddPostController>(
      () => AddPostController(),
    );
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
