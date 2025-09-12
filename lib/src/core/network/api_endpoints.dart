class ApiConstants {
  // auth
  static const String login = '/api/v1/auth/login';
  static const String signUp = '/api/v1/auth/register';
  static const String verifyOtp = '/api/v1/auth/verify-otp';
  static const String sendOtp = '/api/v1/auth/send-otp';

  // home
  static const String home = '/api/v1/home';

  // favorite
  static const String toggleFav = '/api/v1/favourite/add-or-remove';
  static const String getFav = '/api/v1/favourite/list';
}
