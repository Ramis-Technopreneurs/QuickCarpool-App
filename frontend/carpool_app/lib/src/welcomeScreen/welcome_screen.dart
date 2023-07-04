import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../route/route_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late AnimationController _controllerCar;
  late Animation<double> _animationCar;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();

    _controllerCar = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationCar =
        Tween<double>(begin: -100.0, end: 30.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controllerCar.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff024C74),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: size.width * 0.6,
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                //color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/Quick-Logo W.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: SizedBox(
                width: size.width,
                child: CupertinoButton(
                    color: const Color(0xff232323),
                    child: const Text('Get Started >'),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      if (prefs.containsKey("userId")) {
                        if (mounted) {
                          Navigator.pushNamed(context, navigationPageRoute);
                        }
                      } else {
                        if (mounted) {
                          Navigator.pushNamed(context, signInRoute);
                        }
                      }
                    }),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.4,
              decoration: const BoxDecoration(
                //color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/cuate.png'), fit: BoxFit.fill),
              ),
              child: Stack(children: [
                //car
                Positioned(
                  top: 260,
                  left: 20,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(_animationCar.value, 0),
                        child: Container(
                          width: 120,
                          height: 70,
                          decoration: const BoxDecoration(
                              //color: Colors.amber,
                              image: DecorationImage(
                                  image: AssetImage('assets/Car.png'))),
                        ),
                      );
                    },
                  ),
                ),
                // yellow arrow
                Positioned(
                  top: 130,
                  left: 230,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        //color: Colors.amber,
                        image: DecorationImage(
                            image: AssetImage('assets/Vector.png'))),
                  ),
                ),
                //Building
                Positioned(
                  top: 90,
                  right: 50,
                  child: FadeTransition(
                    opacity: _animation,
                    child: Container(
                      width: 100,
                      height: 250,
                      decoration: const BoxDecoration(
                          //color: Colors.amber,
                          image: DecorationImage(
                              image: AssetImage('assets/Group 29.png'))),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
