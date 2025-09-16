class ApiConstants {
  // auth
  static const String login = '/api/v1/auth/login';
  static const String signUp = '/api/v1/auth/register';
  static const String verifyOtp = '/api/v1/auth/verify-otp';
  static const String sendOtp = '/api/v1/auth/send-otp';

  static const String deleteAccount = '/api/v1/auth/delete-account';

  // home
  static const String home = '/api/v1/home';

  // favorite
  static const String toggleFav = '/api/v1/favourite/add-or-remove';
  static const String getFav = '/api/v1/favourite/list';

  // property
  static const String property = '/api/v1/property';
  static const String reservations = '/api/v1/property/client/reservations';
}
