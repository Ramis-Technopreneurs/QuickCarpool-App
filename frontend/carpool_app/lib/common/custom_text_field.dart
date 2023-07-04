import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextStyle? hintStyle;
  final TextEditingController? controller; 
  const CustomTextField({super.key, required this.title, this.hintStyle, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: hintStyle
      ),
    );
  }
}
