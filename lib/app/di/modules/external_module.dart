import 'package:dio/dio.dart';

import '../../network/dio_factory.dart';
import '../../network/interceptors/auth_interceptor.dart';
import '../../../core/auth/auth_session.dart';
import '../app_di.dart';

Future<void> registerExternalModule(AppDi sl) async {
  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(sl.get<AuthSession>()),
  );

  sl.registerLazySingleton<Dio>(
    () => buildAppDio(authInterceptor: sl.get<AuthInterceptor>()),
  );
}
