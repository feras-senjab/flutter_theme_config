import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_theme_config/Style/Theme/cubit/theme_cubit.dart';

import 'Config/simble_bloc_observer.dart';
import 'Style/Theme/app_theme.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(BlocProvider(
    create: (context) => ThemeCubit(themePreferenceKey: 'theme'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Theme Config',
            theme: state.appTheme.themeData,
            home: const HomeScreen(),
          );
        });
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Switcher')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Switch(
              value:
                  context.watch<ThemeCubit>().state.appTheme == AppTheme.dark,
              onChanged: (bool value) {
                final newTheme = value ? AppTheme.dark : AppTheme.light;
                context
                    .read<ThemeCubit>()
                    .setTheme(newTheme, updateUIOnStorageError: true);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => context
                .read<ThemeCubit>()
                .setDefaultTheme(updateUIOnStorageError: true),
            child: const Text('Default'),
          ),
          Text(
              'Is using system theme: ${context.watch<ThemeCubit>().state.isUsingSystemTheme}')
        ],
      ),
    );
  }
}
