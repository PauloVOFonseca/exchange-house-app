import 'package:flutter/material.dart';

MaterialApp makeApp(Widget home) {
  return MaterialApp(
    title: 'Exchange House App',
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: home,
  );
}
