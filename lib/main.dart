import 'package:flutter/material.dart';
import 'package:galaxy_planet/screen/home/provider/home_provider.dart';
import 'package:galaxy_planet/utils/app_routes.dart';
import 'package:galaxy_planet/utils/app_theme.dart';
import 'package:galaxy_planet/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          value.setTheme();
          return MaterialApp(

            debugShowCheckedModeBanner: false,
            routes: appRoutes,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                value.themeMode == true ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    ),
  );
}
