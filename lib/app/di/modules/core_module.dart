import '../../theme/app_theme_controller.dart';
import '../app_di.dart';

Future<void> registerCoreModule(AppDi sl) async {
  if (!sl.isRegistered<AppThemeController>()) {
    sl.registerSingleton<AppThemeController>(AppThemeController());
  }
}
