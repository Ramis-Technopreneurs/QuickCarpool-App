import 'package:carpool_app/src/account/account_screen.dart';
import 'package:carpool_app/src/activity/activity_screen.dart';
import 'package:carpool_app/src/home/home.dart';
import 'package:flutter/material.dart';
import '../../data/user/user.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int pageIndex = 1;

  List<Widget> pageList = <Widget>[
    const ActivityScreen(),
    HomeScreen(userController: UserController()),
    AccountScreen(userController: UserController())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff232323),
        unselectedItemColor: const Color(0xff929698),
        selectedItemColor: const Color(0xff0077B6),
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/activity_icon.png',
                height: 30,
                width: 30,
                color: pageIndex == 0
                    ? const Color(0xff0077B6)
                    : const Color(0xff929698),
              ),
              label: 'Activity'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/nav_car_image.png',
                height: 30,
                width: 30,
                color: pageIndex == 1
                    ? const Color(0xff0077B6)
                    : const Color(0xff929698),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile_icon.png',
                height: 30,
                width: 30,
                color: pageIndex == 2
                    ? const Color(0xff0077B6)
                    : const Color(0xff929698),
              ),
              label: 'Account'),
        ],
      ),
      body: pageList[pageIndex],
    );
  }
}
