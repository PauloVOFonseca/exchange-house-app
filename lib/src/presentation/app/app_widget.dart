import 'package:exchange_house_app/src/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exchange House App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SplashPage(),
    );
  }
}
