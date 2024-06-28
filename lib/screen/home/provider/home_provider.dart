import 'package:flutter/material.dart';
import 'package:galaxy_planet/screen/home/model/home_model.dart';
import 'package:galaxy_planet/utils/helper/json_helper.dart';
import 'package:galaxy_planet/utils/shared_helper.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> planetList = [];
  JsonHelper helper = JsonHelper();
  List<String> likePlanetImg = [];
  List<String> likeName = [];

  Future<void> getPlanetJson() async {
    planetList = await helper.planetJson();
    notifyListeners();
  }

  Future<void> setLikePlanet(String name1, String pImg) async {
    List<String>? name = await getPlanetName();
    List<String>? img = await getPlanetImg();
    if (name != null && img != null) {
      name.add(name1);
      img.add(pImg);
      setPlanetName(name);
      setPlanetImg(img);
    } else {
      setPlanetName([name1]);
      setPlanetImg([pImg]);
    }
    getPlanetName();
    getPlanetImg();

    notifyListeners();
  }

  Future<void> getPlanetData() async {
    var list = await getPlanetImg();
    var list2 = await getPlanetName();
    if (list2 != null && list != null) {
      likeName = list2;
      likePlanetImg = list;
      notifyListeners();
    }
  }

  void deleteLikePlanet(int index) {
    likeName.removeAt(index);
    likePlanetImg.removeAt(index);
    notifyListeners();
  }
}
