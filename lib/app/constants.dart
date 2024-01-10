class Constants {
  static const String baseUrl = "https://api.themoviedb.org";
  static const String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMDA0ZDExN2FjMGIwNGUxMGRlNmRmOGEwZjNiMjM1OCIsInN1YiI6IjY1OWRjNGM0Nzc3NmYwMDIwMTNiMjYyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cOtceq_yTy-8yLaBcbp7oUoi44Vm5lTfmeDM1O-2rkc";
  static const String imagePath = "https://image.tmdb.org/t/p/w500";
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
  static const String popularMovies = "/3/movie/popular";

}
