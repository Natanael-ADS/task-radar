import '../../theme/app_theme_cubit.dart';
import '../app_di.dart';

Future<void> registerCoreModule(AppDi sl) async {
  sl.registerSingleton<AppThemeCubit>(AppThemeCubit());
}
