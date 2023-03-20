import 'package:get/get.dart';

import 'package:tiktok/app/modules/authentication/binding/auth_binding.dart';
import 'package:tiktok/app/modules/authentication/views/login_screen.dart';
import 'package:tiktok/app/modules/authentication/views/signup_screen.dart';
import 'package:tiktok/app/modules/home/bindings/home_binding.dart';
import 'package:tiktok/app/modules/home/views/home_view.dart';
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
  ];
}
