class ApiConstants {
  // auth
  static const String login = '/api/v1/auth/login';
  static const String signUp = '/api/v1/auth/register';
  static const String verifyOtp = '/api/v1/auth/verify-otp';
  static const String sendOtp = '/api/v1/auth/send-otp';

  static const String deleteAccount = '/api/v1/auth/delete-account';
  static const String logout = '/api/v1/auth/logout';
  static const String changeNotfiy = '/api/v1/auth/edit-preferences';
  static const String verfiyNewPhone = '/api/v1/auth/verify-mobile';
  static const String changeMobile = '/api/v1/auth/change-mobile';
  static const String refreshToken = '/api/v1/auth/refresh-token';

  // home
  static const String home = '/api/v1/home';

  // notification
  static const String notification = '/api/v1/notification/list';
  static const String deleteNotification = '/api/v1/notification/mark-as-read';

  // favorite
  static const String toggleFav = '/api/v1/favourite/add-or-remove';
  static const String getFav = '/api/v1/favourite/list';

  // property
  static const String property = '/api/v1/property';
  static const String reservations = '/api/v1/property/client/reservations';
  static const String filter = '/api/v1/property/filter-data';

  // settings
  static const String editProifle = '/api/v1/auth/edit-profile';
  static const String terms = '/api/v1/policy/by-id';
  static const String contactUs = '/api/v1/contact-message';
}
