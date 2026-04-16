import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/bootstrap/bootstrap.dart';
import 'app/di/injection.dart';
import 'app/router/app_router.dart';
import 'app/theme/app_theme_cubit.dart';
import 'app/theme/app_theme_data.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = injector.get<AppThemeCubit>();

    return BlocProvider.value(
      value: themeCubit,
      child: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (_, themeMode) {
          return MaterialApp.router(
            title: 'task_radar',
            theme: AppThemeData.light(),
            darkTheme: AppThemeData.dark(),
            themeMode: themeMode,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
