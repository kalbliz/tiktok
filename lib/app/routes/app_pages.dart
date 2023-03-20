import 'package:go_router/go_router.dart';
import 'package:tiktok/app/modules/authentication/views/login_screen.dart';
import 'package:tiktok/app/modules/authentication/views/signup_screen.dart';
import 'package:tiktok/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final GoRouter routes =
      GoRouter(initialLocation: Paths.SIGNUP, routes: [
    GoRoute(
      name: Paths.LOGIN,
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
     GoRoute(
      name: Paths.SIGNUP,
      path: '/sign-up',
      builder: (context, state) => const SignUpView(),
    ),
  ]);
}
