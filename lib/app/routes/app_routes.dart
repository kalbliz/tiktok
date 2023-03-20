abstract class Paths {
  static const LOGIN = '/login';
   static const SIGNUP = '/sign-up';
 
}

abstract class AppRoutes {
  AppRoutes._();
  static const SIGNUP = Paths.SIGNUP;
  static const LOGIN = Paths.LOGIN;
}
