import '../../../core/auth/auth_session.dart';
import '../../theme/app_theme_cubit.dart';
import '../app_di.dart';

Future<void> registerCoreModule(AppDi sl) async {
  sl.registerSingleton<AuthSession>(AuthSession());
  sl.registerSingleton<AppThemeCubit>(AppThemeCubit());
}
