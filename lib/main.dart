import 'package:flutter/material.dart';
import 'features/faqpage/presentation/view/faq_screen.dart';
import 'features/policypage/presentation/view/policy_screen.dart';
import 'features/shopbycategorypage/presentation/view/shopbycategory_screen.dart';
import 'features/shopcartpage/presentation/view/shop_cart_screen.dart';
import 'features/termpage/presentation/view/term_screen.dart';
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
    return MaterialApp(
      title: 'DoAnTotNghiep',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(0, 148, 255, 1),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FAQScreen(),
    );
  }
}