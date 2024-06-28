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
    List<String>? img = await getPlanetImg();
    List<String>? name = await getPlanetName();
    if (img != null && name != null) {
      img.add(pImg);
      name.add(name1);
      setPlanetImg(img);
      setPlanetName(name);
    } else {
      setPlanetImg([pImg]);
      setPlanetName([name1]);
    }
    getPlanetImg();
    getPlanetName();
    notifyListeners();
  }

  Future<void> getPlanetData() async {
    var list = await getPlanetImg();
    var list2 = await getPlanetName();
    if (list != null && list2 != null) {
      likePlanetImg = list;
      likeName = list2;
      notifyListeners();
    }
  }

  void deleteLikePlanet(int index)
  {
    likeName.removeAt(index);
    likePlanetImg.removeAt(index);
    notifyListeners();
  }
}
