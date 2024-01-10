import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/app_prefs.dart';
import '../../app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";
const String ACCEPT_LANGUAGE = "Accept-Language";
const String RETRY_COUNTER = "Retry-Count";
const String USER_TYPE = "User-Type";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: "Bearer ${Constants.accessToken}",
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          return handler.next(error);
        },
      ),
    );

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
