// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyElevatedButton extends StatelessWidget {
  Function() function;
  String title;
  Color bgColor;
  BorderRadiusGeometry borderRadius;
  Color textcolor;
  MyElevatedButton({
    Key? key,
    required this.function,
    required this.title,
    required this.bgColor,
    required this.borderRadius,
    this.textcolor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            backgroundColor: bgColor,
            padding: const EdgeInsets.symmetric(vertical: 16)),
        onPressed: function,
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: textcolor),
        ));
  }
}
