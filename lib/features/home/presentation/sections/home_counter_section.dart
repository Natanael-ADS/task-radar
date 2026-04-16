import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/app_theme_cubit.dart';
import '../bloc/home_counter_cubit.dart';

class HomeCounterSection extends StatelessWidget {
  const HomeCounterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<AppThemeCubit, ThemeMode>(
      builder: (_, themeMode) {
        final isDarkMode = themeMode == ThemeMode.dark;

        return BlocBuilder<HomeCounterCubit, int>(
          builder: (_, counter) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isDarkMode ? 'Tema atual: Escuro' : 'Tema atual: Claro',
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Você apertou o botão esta quantidade de vezes:',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                Text('$counter', style: textTheme.headlineMedium),
              ],
            );
          },
        );
      },
    );
  }
}
