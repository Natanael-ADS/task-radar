import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_radar/app/theme/app_theme_cubit.dart';
import 'package:task_radar/features/home/presentation/widgets/home_counter_section.dart';

import '../../../../app/di/injection.dart';
import '../bloc/home_counter_cubit.dart';
import '../widgets/home_theme_toggle_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector.get<HomeCounterCubit>(),
      child: BlocBuilder<AppThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          final homeCounterCubit = context.read<HomeCounterCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Task Radar'),
              actions: [
                HomeThemeToggleButton(isDarkMode: themeMode == ThemeMode.dark),
              ],
            ),
            body: const Center(child: HomeCounterSection()),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Increment',
              onPressed: homeCounterCubit.increment,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
