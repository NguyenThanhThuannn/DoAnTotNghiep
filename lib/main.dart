import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/search/presentation/bloc/local_search_bloc.dart';
import 'features/themechange/bloc/theme_bloc.dart';
import 'features/themechange/data/theme.dart';
import 'injection_container.dart';
import 'widgets/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (final context) => sl(),
        ),
        BlocProvider<LocalSearchBloc>(
          create: (final context) => sl()..add(const GetSavedSearches()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (final context, final state) {
          return MaterialApp(
            title: 'DoAnTotNghiep',
            theme: state.theme.themeData,
            darkTheme: darkTheme,
            home: const OnboardingScreen(),
          );
        },
      ),
    );
  }
}
