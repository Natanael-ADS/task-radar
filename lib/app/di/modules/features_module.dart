import '../../../features/auth/domain/usecases/clear_session_usecase.dart';
import '../../../features/auth/domain/usecases/login_usecase.dart';
import '../../../features/auth/domain/usecases/restore_session_usecase.dart';
import '../../../features/home/presentation/bloc/home_counter_cubit.dart';
import '../app_di.dart';

Future<void> registerFeaturesModule(AppDi sl) async {
  sl.registerFactory<HomeCounterCubit>(HomeCounterCubit.new);
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl.get()));
  sl.registerLazySingleton<RestoreSessionUseCase>(
    () => RestoreSessionUseCase(sl.get()),
  );
  sl.registerLazySingleton<ClearSessionUseCase>(
    () => ClearSessionUseCase(sl.get()),
  );
}
