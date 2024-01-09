class Constants {
  static const String baseUrl = "https://test.kafiil.com";
  static const String empty = "";
  static const String token = "";
  static const int zero = 0;
  static const int apiTimeOut = 60000;
  static const String GOOGLE_API_KEY_ANDROID = "";
  static const String GOOGLE_API_KEY_IOS = "";
  static const String UPLOAD_DOCUMENTS_TYPE = "upload_documents_type";

  static const int IMAGE_QUALITY_COMPRESS = 25;
  static const String dateFormatterString = "dd/MM/yyyy hh:mm:ss";

  static const int refreshCurrentLocationSeconds = 2;

  static const int otpCountTime = 30;
  static const int otpSize = 6;
  static const bool showCursorOtpField = false;
  static const int SPLASH_SCREEN_TIME = 3;
}

class UserTypeConstants {
  static const String END_USER = "END_USER";
  static const String ADMIN = "ADMIN";
}

class Endpoints {
  static const String login = "/api/test/user/login";
  static const String registration = "/api/test/user/register";
  static const String countries = "/api/test/country";
  static const String lookups = "/api/test/dependencies";
  static const String whoAmI = "/api/test/user/who-am-i";
  static const String services = "/api/test/service";
  static const String popularServices = "/api/test/service/popular";

  static const List<String> cancelTokenApis = [
    login,
    registration,
    countries,
    lookups,
    services,
    popularServices
  ];
}
