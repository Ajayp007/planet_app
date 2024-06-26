import 'package:flutter/material.dart';
import 'package:galaxy_planet/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? animationController;
  Tween<double>? rotationPlanet;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getPlanetData();
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
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        child: Column(
          children: [
            Text("Hello"),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.network(
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
                    child:
                        Image.network("${providerR!.planetList[index].image}"),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
