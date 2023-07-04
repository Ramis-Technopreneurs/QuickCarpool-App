import 'package:carpool_app/common/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomBlueHeader extends StatelessWidget {
  final Size size;
  final VoidCallback callback;
  final IconData icon;
  final String title;
  final double fromleft;

  const CustomBlueHeader(
      {super.key,
      required this.size,
      required this.callback,
      required this.icon,
      required this.title,
      required this.fromleft});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: size.width,
        height: size.height * 0.08,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(3, 3),
                color: Colors.grey,
                blurRadius: 5,
              )
            ],
            color: primaryColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: GestureDetector(
                onTap: () {
                  callback();
                },
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: fromleft),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
