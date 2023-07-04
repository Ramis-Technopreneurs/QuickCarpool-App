import 'dart:async';
import 'package:flutter/material.dart';

import '../welcomeScreen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation? _animation;
  bool isAnimationStart = false;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      isAnimationStart = true;
    });
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animation = Tween(begin: 1000.0, end: 0.0).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 250,
          left: 50,
          right: 50,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Quick-Logo 1.png'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(
              0, isAnimationStart ? 0 : size.height - 40, 0),
          child: Image.asset("assets/images/curve.png"),
        ),
        AnimatedContainer(
          height: size.height,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(
              0, isAnimationStart ? 0 : size.height / 1, 0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff0071AE),
                Color(0xff009AC9),
                Color(0xff00B4D8),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
        ),
      ],
    ));
  }
}
