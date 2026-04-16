import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/auth/auth_session.dart';
import '../../theme/app_theme_cubit.dart';
import '../app_di.dart';

Future<void> registerCoreModule(AppDi sl) async {
  const secureStorage = FlutterSecureStorage();
  final authSession = AuthSession(secureStorage);
  await authSession.hydrate();

  sl.registerSingleton<AuthSession>(authSession);
  sl.registerSingleton<AppThemeCubit>(AppThemeCubit());
}
