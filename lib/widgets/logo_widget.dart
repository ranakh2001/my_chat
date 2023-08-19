import 'package:flutter/material.dart';

import '../constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 70),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: kPrinmaryColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(95),
              bottomRight: Radius.circular(95),
              bottomLeft: Radius.circular(100))),
      child: const Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CircleAvatar(
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
            )
          ]),
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "TalkTo.Me",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          )
        ],
      ),
    );
  }
}
