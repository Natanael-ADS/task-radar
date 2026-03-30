import 'package:flutter/material.dart';

import '../../../../app/di/injection.dart';
import '../../../../app/theme/app_theme_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  late final AppThemeController _themeController;

  @override
  void initState() {
    super.initState();
    _themeController = injector.get<AppThemeController>();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeController,
      builder: (context, child) {
        final isDarkMode = _themeController.isDarkMode;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Task Radar'),
            actions: [
              IconButton(
                onPressed: _themeController.toggleLightDark,
                tooltip: isDarkMode
                    ? 'Alternar para tema claro'
                    : 'Alternar para tema escuro',
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isDarkMode ? 'Tema atual: Escuro' : 'Tema atual: Claro'),
                const SizedBox(height: 16),
                const Text('Você apertou o botão esta quantidade de vezes:'),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
