import 'package:flutter/material.dart';

import '../constants.dart';

class MyFAB extends StatelessWidget {
  final Function() onTap;
  const MyFAB({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        backgroundColor: kPrinmaryColor,
        onPressed: onTap,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
