import 'package:flutter/material.dart';
import 'package:galaxy_planet/screen/detail/detail_screen.dart';
import 'package:galaxy_planet/screen/favorite/favorite_screen.dart';
import 'package:galaxy_planet/screen/home/view/home_screen.dart';
import 'package:galaxy_planet/screen/splash/splash_screen.dart';

Map<String,WidgetBuilder> appRoutes=
{
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'fav':(context) => const FavoriteScreen(),
  'detail':(context) => const DetailScreen(),
};