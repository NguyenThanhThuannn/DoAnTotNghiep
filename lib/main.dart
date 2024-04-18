import 'package:flutter/material.dart';

import 'features/homepage/presentation/view/home_page_screen.dart';

void main() {
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
      home: const HomePageScreen(),
    );
  }
}