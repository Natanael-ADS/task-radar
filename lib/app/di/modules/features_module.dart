import '../../../features/home/presentation/bloc/home_counter_cubit.dart';
import '../app_di.dart';

Future<void> registerFeaturesModule(AppDi sl) async {
  sl.registerFactory<HomeCounterCubit>(HomeCounterCubit.new);
}
