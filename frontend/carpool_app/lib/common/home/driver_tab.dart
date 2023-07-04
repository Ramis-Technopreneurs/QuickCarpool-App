import 'package:flutter/material.dart';

class DriverTab extends StatelessWidget {
  final Size size;
  final int selectedIndex;
  final Function(int) changeIndexDriver;
  const DriverTab({super.key, required this.size, required this.selectedIndex, required this.changeIndexDriver});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 4),
        GestureDetector(
          onTap: (){
            changeIndexDriver(0);
          },
          child: Container(
            height: 60,
            width: size.width / 2 - 30,
            decoration: BoxDecoration(
              color: selectedIndex == 0 ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icon_passenger.png',
                  height: 30,
                  width: 30,
                  color: selectedIndex == 0 ? Colors.white : const Color(0xff929698),
                ),
                const SizedBox(width: 5),
                Text(
                  'Get a ride',
                  style: TextStyle(
                    color: selectedIndex == 0 ? Colors.white : const Color(0xff929698),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: (){
            changeIndexDriver(1);
          },
          child: Container(
            height: 60,
            width: size.width / 2 - 30,
            decoration: BoxDecoration(
              color: selectedIndex == 1 ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/iocn_driver.png',
                  height: 30,
                  width: 30,
                  color: selectedIndex == 1 ? Colors.white : const Color(0xff929698),
                ),
                const SizedBox(width: 5),
                Text(
                  'Offer a ride',
                  style: TextStyle(
                    color: selectedIndex == 1 ? Colors.white : const Color(0xff929698),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
