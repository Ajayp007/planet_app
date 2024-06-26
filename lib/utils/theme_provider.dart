import 'package:flutter/material.dart';
import 'package:galaxy_planet/utils/shared_helper.dart';

class ThemeProvider with ChangeNotifier {
  bool? themeMode = true;

  Future<void> setTheme() async {
    SharedHelper helper = SharedHelper();
    themeMode = await helper.getThemeData();
    notifyListeners();
  }
}
