import 'dart:io';
import 'package:exchange_house_app/src/application/constants/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    await Hive.openBox(HiveKeys.currenciesHistory);
  }

  closeBox() async {
    await Hive.close();
  }
}
