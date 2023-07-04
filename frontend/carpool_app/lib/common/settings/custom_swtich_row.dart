import 'package:carpool_app/common/utils/utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSwitchRow extends StatelessWidget {
  Size size;
  String title;
  bool switchValue;
  //bool val;
  final Function(bool) callbackAction;
  CustomSwitchRow(
      {super.key,
      // required this.val,
      required this.title,
      required this.switchValue,
      required this.callbackAction,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: size.width * 0.04),
        ),
        Transform.scale(
            scale: 1.5,
            child: Switch(
                activeColor: primaryColor,
                splashRadius: 30,
                value: switchValue,
                onChanged: callbackAction)),
      ],
    );
  }
}
