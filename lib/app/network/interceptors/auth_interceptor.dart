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
}
