import 'package:hive_flutter/hive_flutter.dart';

class AppHive {
  static Future<void> init() async {
    await Hive.initFlutter();
  }
}
