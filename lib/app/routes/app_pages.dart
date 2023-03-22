import 'package:get/get.dart';

import 'package:tiktok/app/modules/add_post/bindings/add_post_binding.dart';
import 'package:tiktok/app/modules/add_post/views/add_post_view.dart';
import 'package:tiktok/app/modules/authentication/binding/auth_binding.dart';
import 'package:tiktok/app/modules/authentication/views/login_screen.dart';
import 'package:tiktok/app/modules/authentication/views/signup_screen.dart';
import 'package:tiktok/app/modules/confirm_screen/bindings/confirm_screen_binding.dart';
import 'package:tiktok/app/modules/confirm_screen/views/confirm_screen_view.dart';
import 'package:tiktok/app/modules/home/bindings/home_binding.dart';
import 'package:tiktok/app/modules/home/views/home_view.dart';
import 'package:tiktok/app/modules/nav/bindings/nav_binding.dart';
import 'package:tiktok/app/modules/nav/views/nav_view.dart';
import 'package:tiktok/app/modules/profile/bindings/profile_binding.dart';
import 'package:tiktok/app/modules/profile/views/profile_view.dart';
import 'package:tiktok/app/modules/search/bindings/search_binding.dart';
import 'package:tiktok/app/modules/search/views/search_view.dart';
import 'package:tiktok/app/modules/message/bindings/video_screens_binding.dart';
import 'package:tiktok/app/modules/message/views/video_screens_view.dart';
import 'package:tiktok/app/routes/app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = AppRoutes.LOGIN;
  static final routes = [
    GetPage(
      name: AppPaths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppPaths.SIGNUP,
      page: () => const SignUpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppPaths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppPaths.ADD_POST,
      page: () => AddPostView(),
      binding: AddPostBinding(),
    ),
    GetPage(
      name: AppPaths.NAV,
      page: () => NavView(),
      binding: NavBinding(),
    ),
    GetPage(
      name: AppPaths.CONFIRM_SCREEN,
      page: () => ConfirmScreenView(),
      binding: ConfirmScreenBinding(),
    ),
    GetPage(
      name: AppPaths.MESSAGES,
      page: () => MessagesView(),
      binding: MessagesBinding(),
    ),
    GetPage(
      name: AppPaths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppPaths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
