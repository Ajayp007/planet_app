import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:galaxy_planet/screen/home/model/home_model.dart';

class JsonHelper {
  Future<List<HomeModel>> planetJson() async {
    String planetString =
        await rootBundle.loadString("assets/json/planet.json");
    List planetList = jsonDecode(planetString);
    List<HomeModel> l1 = planetList
        .map(
          (e) => HomeModel.mapToModel(e),
        )
        .toList();
    return l1;
  }
}
