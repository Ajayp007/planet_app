import 'package:shared_preferences/shared_preferences.dart';


  Future<void> setThemeData(bool themeData) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool('true', themeData);
  }

  Future<bool?> getThemeData() async {
    bool? data;
    SharedPreferences shr = await SharedPreferences.getInstance();
    data = shr.getBool('true')!;
    return data;
  }

  Future<void> setPlanetImg(List<String> l1) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('planet', l1);
  }

  Future<List<String>?> getPlanetImg() async {
    List<String>? planetList = [];

    SharedPreferences shr = await SharedPreferences.getInstance();

    planetList = shr.getStringList('planet');
    return planetList;
  }

Future<void> setPlanetName(List<String> l1) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  await shr.setStringList('planet', l1);
}

Future<List<String>?> getPlanetName() async {
  List<String>? planetList = [];

  SharedPreferences shr = await SharedPreferences.getInstance();

  planetList = shr.getStringList('planet');
  return planetList;
}

