// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_chat/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;
  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BottomNavigationBar(
            onTap: onTap,
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: kSecondryColor,
            backgroundColor: kPrinmaryColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.messenger), label: 'messages'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'profile')
            ]),
      ),
    );
  }
}
