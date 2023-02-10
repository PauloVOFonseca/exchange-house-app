import 'package:exchange_house_app/src/application/services/hive_config.dart';
import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/presentation/app/app_widget.dart';
import 'package:exchange_house_app/src/presentation/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  Future.delayed(Duration.zero, () async {
    await HiveConfig.initHive();
  });
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeController()),
  ], child: const AppWidget()));
}
