import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/app_theme_cubit.dart';

class HomeThemeToggleButton extends StatelessWidget {
  const HomeThemeToggleButton({required this.isDarkMode, super.key});

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.read<AppThemeCubit>().toggleLightDark,
      tooltip: isDarkMode
          ? 'Alternar para tema claro'
          : 'Alternar para tema escuro',
      icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
    );
  }
}
