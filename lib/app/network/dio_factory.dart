import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'interceptors/auth_interceptor.dart';

Dio buildAppDio({required AuthInterceptor authInterceptor}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(authInterceptor);

  return dio;
}
