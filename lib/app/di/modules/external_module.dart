import 'package:dio/dio.dart';

import '../../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../../features/auth/domain/repositories/auth_repository.dart';
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

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(sl.get<Dio>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl.get<AuthRemoteDataSource>(),
      sl.get<AuthSession>(),
    ),
  );
}
