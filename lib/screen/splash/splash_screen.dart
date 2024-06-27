import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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
      body: Image.network(
        "https://i.pinimg.com/originals/f3/44/e5/f344e503cfbccb7444500e2eef0d83fe.gif",
        fit: BoxFit.cover,
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
      ),
    );
  }
}
