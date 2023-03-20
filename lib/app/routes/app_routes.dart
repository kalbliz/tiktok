abstract class AppPaths {
  static const LOGIN = '/login';
  static const SIGNUP = '/sign-up';
  static const HOME = '/home';
}

abstract class AppRoutes {
  AppRoutes._();
  static const SIGNUP = AppPaths.SIGNUP;
  static const LOGIN = AppPaths.LOGIN;
  static const HOME = AppPaths.HOME;
}
