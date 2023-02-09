import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/presentation/app/app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppWidget());
}
