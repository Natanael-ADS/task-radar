import 'dart:async';

import 'package:dio/dio.dart';

import '../../../core/auth/auth_session.dart';

final class AuthInterceptor extends Interceptor {
  final AuthSession _authSession;

  AuthInterceptor(this._authSession);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_authSession.isAuthenticated) {
      options.headers['Authorization'] = 'Bearer ${_authSession.accessToken}';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      unawaited(_authSession.clear());
    }

    handler.next(err);
  }
}
