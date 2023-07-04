import 'dart:math';

import 'package:flutter/material.dart';

class CustomSelectableCarServiceOption extends StatelessWidget {
  final String title;
  final String image;
  final int index;
  final int selectedIndex;
  final Function(int) setIndex;
  const CustomSelectableCarServiceOption(
      {super.key,
      required this.title,
      required this.image,
      required this.index,
      required this.setIndex,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setIndex(index);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Container(
                height: 80,
                width: 110,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? const Color(0xff0077B6)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Image.asset(image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
