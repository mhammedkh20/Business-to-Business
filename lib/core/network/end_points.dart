// ignore_for_file: constant_identifier_names

class EndPoints {
  static const String BASE_URL = 'https://anonymous/api';
  // ! Auth
  static const String LOGIN = '/auth/login';
  static const String REGISTR = '/auth/register';
  static const String VERIFY_CODE = '/auth/verify-code';
  static const String FORGET_PASSWORD = '/auth/forget-password';
  static const String RESET_PASSWORD = '/auth/reset-password';
  static const String LOGOUT = '/auth/logout';
  static const String UPDATE_ACCOUNT_DATA = '/auth/update-profile';
  static const String UPDATE_ACCOUNT_IMAGE = '/auth/update-image';
  static const String CHANGE_PASSWORD = '/auth/change-password';

  // ! News
  static const String NEWS = '/news';
}
