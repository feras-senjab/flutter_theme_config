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
    Widget space = const SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Theme Config')),
      body: ListView(
        children: [
          space,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Switch(
                value:
                    context.watch<ThemeCubit>().state.appTheme == AppTheme.dark,
                onChanged: (bool value) {
                  final newTheme = value ? AppTheme.dark : AppTheme.light;
                  context.read<ThemeCubit>().setTheme(newTheme);
                },
              ),
              ElevatedButton(
                onPressed: context.watch<ThemeCubit>().state.isUsingSystemTheme
                    ? null
                    : () => context.read<ThemeCubit>().setDefaultTheme(),
                child: const Text('Default'),
              ),
              Text(
                  'Is using system theme: ${context.watch<ThemeCubit>().state.isUsingSystemTheme}')
            ],
          ),
          const Divider(),
          // ! Text Theme Preview..
          //---------------- display -----------------------//
          Text(
            'displaySmall',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'displayMedium',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'displayLarge',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          space,
          //---------------- headline -----------------------//
          Text(
            'headlineSmall',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'headlineMedium',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'headlineLarge',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          space,
          //---------------- title -----------------------//
          Text(
            'titleSmall',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            'titleMedium',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'titleLarge',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          space,
          //---------------- body -----------------------//
          Text(
            'bodySmall',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Text(
            'bodyMedium (default)',
          ),
          Text(
            'bodyLarge',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          space,
          //---------------- label -----------------------//
          Text(
            'labelSmall',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            'labelMedium',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            'labelLarge',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
