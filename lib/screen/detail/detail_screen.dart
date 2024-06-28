import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planet/utils/theme_provider.dart';
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
  ThemeProvider? providerWT;
  ThemeProvider? providerRT;
  AnimationController? animationController;
  Tween<double>? rotationPlanet;
  Animation<Alignment>? alimentController;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getPlanetData();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    rotationPlanet = Tween(begin: 0, end: 1);
    // alimentController = Tween<Alignment>(
    //         begin: const Alignment(-2, 0), end: const Alignment(2, 0))
    //     .animate(animationController!);
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
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Text(
                        "${providerR!.planetList[index].name}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: () {
                          providerR!.setLikePlanet(
                              providerR!.planetList[index].name!,
                              providerR!.planetList[index].image!);
                        },
                        icon: const Icon(Icons.favorite_border_outlined),
                      ),
                    ],
                  ),
                  RotationTransition(
                    turns: rotationPlanet!.animate(animationController!),
                    child: Center(
                      child: Hero(
                        tag: "$index",
                        child: Image.network(
                          "${providerW!.planetList[index].image}",
                          height: 300,
                        ),
                      ),
                    ),
                  ),
            
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        "${providerW!.planetList[index].name}",
                        textStyle: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            "Position in Solar System :- ",
                            textStyle: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            "${providerW!.planetList[index].position}",
                            textStyle: const TextStyle(fontSize: 22),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            "Velocity :- ",
                            textStyle: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            
                          )
                        ],
                      ),
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            "${providerW!.planetList[index].velocity}",
                            textStyle: const TextStyle(fontSize: 22),
            
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            "Distance From Sun :- ",
                            textStyle: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            "${providerW!.planetList[index].distance} million km",
                            textStyle: const TextStyle(fontSize: 22),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("About This Planet :-",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText(
                        "${providerW!.planetList[index].description}",
                        textStyle: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.justify
                      )
                    ],
                  ),
                ],
              ),
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
