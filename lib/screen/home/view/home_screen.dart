import 'package:flutter/material.dart';
import 'package:galaxy_planet/screen/home/provider/home_provider.dart';
import 'package:galaxy_planet/utils/shared_helper.dart';
import 'package:galaxy_planet/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  ThemeProvider? providerWT;
  ThemeProvider? providerRT;
  AnimationController? animationController;
  Tween<double>? rotationPlanet;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getPlanetJson();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    rotationPlanet = Tween(begin: 0, end: 1);
    animationController!.addListener(
      () {
        setState(() {});
      },
    );
    animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    providerWT = context.watch<ThemeProvider>();
    providerRT = context.read<ThemeProvider>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Stack(
          children: [
            providerWT!.themeMode == true
                ? Image.network(
              "https://i.pinimg.com/564x/1f/4a/d9/1f4ad9b6fef3e5eb47d3bc7b61549e08.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height,
            )
                : Image.network(
              "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L25zMTEyNjgtaW1hZ2Uta3d2eWRoajYuanBn.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text(
                      "Home",
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.favorite_border_outlined),
                    title: const Text(
                      "Favorite",
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'fav');
                      },
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.wb_sunny_outlined),
                    title: const Text(
                      "Theme",
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Switch(
                      value: providerWT!.themeMode!,
                      onChanged: (value) {
                        setThemeData(value);
                        providerRT!.setTheme();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          providerWT!.themeMode == true
              ? Image.network(
            "https://i.pinimg.com/564x/1f/4a/d9/1f4ad9b6fef3e5eb47d3bc7b61549e08.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
          )
              : Image.network(
            "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L25zMTEyNjgtaW1hZ2Uta3d2eWRoajYuanBn.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
                const SizedBox(
                  width: 90,
                ),
                const Text(
                  "Our Solar System",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: GridView.builder(
              itemCount: providerW!.planetList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return RotationTransition(
                  turns: rotationPlanet!.animate(animationController!),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail', arguments: index);
                    },
                    child: Hero(
                      tag: "$index",
                      child: Image.network(
                          "${providerR!.planetList[index].image}"),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}
