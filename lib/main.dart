import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/themechange/bloc/theme_bloc.dart';
import 'features/themechange/data/theme.dart';
import 'features/faqpage/presentation/view/faq_screen.dart';
import 'features/policypage/presentation/view/policy_screen.dart';
import 'features/shopbycategorypage/presentation/view/shopbycategory_screen.dart';
import 'features/shopcartpage/presentation/view/shop_cart_screen.dart';
import 'features/termpage/presentation/view/term_screen.dart';
import 'features/themechange/domain/themeEntity.dart';
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
    return BlocProvider<ThemeBloc>(
      create: (final context) => sl(),
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
