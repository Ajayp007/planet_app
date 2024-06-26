import 'package:flutter/material.dart';
import 'package:galaxy_planet/screen/home/model/home_model.dart';
import 'package:galaxy_planet/utils/helper/json_helper.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> planetList = [];

  Future<void> getPlanetData() async {
    JsonHelper helper = JsonHelper();
    planetList = await helper.planetJson();
    notifyListeners();
  }
}
