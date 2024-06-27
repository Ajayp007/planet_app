import 'package:flutter/material.dart';
import 'package:galaxy_planet/screen/home/model/home_model.dart';
import 'package:galaxy_planet/utils/helper/json_helper.dart';
import 'package:galaxy_planet/utils/shared_helper.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> planetList = [];
  JsonHelper helper = JsonHelper();
  List<String> likePlanet = [];

  Future<void> getPlanetJson() async {
    planetList = await helper.planetJson();
    notifyListeners();
  }

  Future<void> setLikePlanet(String value) async {
    List<String>? data = await getPlanetImg();
    data = await getPlanetName();
    if (data != null) {
      data.add(value);
      setPlanetImg([value]);
      setPlanetName([value]);
    } else {
      setPlanetImg([value]);
    }
    getPlanetImg();
    getPlanetName();
    notifyListeners();
  }

  Future<void> getPlanetData() async {
    var list = await getPlanetImg();
    list = await getPlanetName();
    if (list != null) {
      likePlanet = list;
      notifyListeners();
    }
  }
}
