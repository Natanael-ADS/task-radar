import 'package:flutter/material.dart';

import 'app/bootstrap/bootstrap.dart';
import 'app/di/injection.dart';
import 'app/router/app_router.dart';
import 'app/theme/app_theme_controller.dart';
import 'app/theme/app_theme_data.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = injector.get<AppThemeController>();

    return ListenableBuilder(
      listenable: themeController,
      builder: (_, _) {
        return MaterialApp.router(
          title: 'task_radar',
          theme: AppThemeData.light(),
          darkTheme: AppThemeData.dark(),
          themeMode: themeController.themeMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
