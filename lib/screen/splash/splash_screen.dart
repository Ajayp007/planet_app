import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Tween<double>? splashImage;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    splashImage = Tween<double>(begin: 0, end: 1);
    animationController!.addListener(
      () {
        setState(() {});
      },
    );
    animationController!.repeat();

    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L25zMTEyNjgtaW1hZ2Uta3d2eWRoajYuanBn.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
          ),
          RotationTransition(
            turns: splashImage!.animate(animationController!),
            child: Center(
              child: Image.network(
                "https://nineplanets.org/wp-content/uploads/2020/03/mars.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
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
