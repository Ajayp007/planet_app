import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? animationController;
  Tween<double>? rotationPlanet;

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
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L25zMTEyNjgtaW1hZ2Uta3d2eWRoajYuanBn.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
          ),
          RotationTransition(
            turns: rotationPlanet!.animate(animationController!),
            child: Image.network(
              "${providerW!.planetList[index].image}",
            ),
          ),
          const SizedBox(height: 50),
         Padding(
           padding: const EdgeInsets.only(left: 12.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 "${providerW!.planetList[index].name}",
                 style:
                 const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
               ),
               Text(
                 "Position in Solar System :- ${providerW!.planetList[index].position}",
                 style:
                 const TextStyle(fontSize: 20),
               ),
               Text(
                 "Velocity :- ${providerW!.planetList[index].velocity}",
                 style:
                 const TextStyle(fontSize: 20),
               ),
               Text(
                 "Distance From Sun :- ${providerW!.planetList[index].distance} million km",
                 style:
                 const TextStyle(fontSize: 20),
               ),
               Text(
                 "About This Planet :- ${providerW!.planetList[index].description}",
                 style:
                 const TextStyle(fontSize: 20),
                 textAlign: TextAlign.justify,
               ),

             ],
           ),
         )

        ],
      ),
    );
  }
}
