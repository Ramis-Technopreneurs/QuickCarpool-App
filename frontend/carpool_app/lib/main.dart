import 'package:carpool_app/route/route_utils.dart';
import 'package:carpool_app/route/service.dart';
import 'package:flutter/material.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xff024C74),
          primarySwatch: const MaterialColor(
            0xff024C74,
            <int, Color>{
              50: Color(0xffE6F0F3),
              100: Color(0xffC2DCE1),
              200: Color(0xff9FC8CF),
              300: Color(0xff7Bb3BD),
              400: Color(0xff588FAA),
              500: Color(0xff366B98),
              600: Color(0xff244F7C),
              700: Color(0xff1D3F65),
              800: Color(0xff162E4D),
              900: Color(0xff0F1F36),
            },
          )),
          routes: appRoutes,
          navigatorObservers: [MyRouteObserver()],
      debugShowCheckedModeBanner: false,
      title: 'Quick',
      // home: const SplashScreen(),
    );
  }
}
