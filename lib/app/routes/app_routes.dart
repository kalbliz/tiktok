abstract class AppPaths {
  static const LOGIN = '/login';
  static const SIGNUP = '/sign-up';
  static const HOME = '/home';
  static const ADD_POST = '/add-post';
  static const NAV = '/nav';
  static const CONFIRM_SCREEN = '/confirm-screen';
}

abstract class AppRoutes {
  AppRoutes._();
  static const SIGNUP = AppPaths.SIGNUP;
  static const LOGIN = AppPaths.LOGIN;
  static const HOME = AppPaths.HOME;
  static const ADD_POST = AppPaths.ADD_POST;
  static const NAV = AppPaths.NAV;
  static const CONFIRM_SCREEN = AppPaths.CONFIRM_SCREEN;
}
