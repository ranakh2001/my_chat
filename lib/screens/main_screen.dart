import 'package:flutter/material.dart';
import 'package:my_chat/controllers/chatData.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_bottom_nav_bar.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  static const id = '/mainScreen';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<ChatData>(context)
          .tabs[Provider.of<ChatData>(context).currentindex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: Provider.of<ChatData>(context).currentindex,
        onTap: (index) {
          Provider.of<ChatData>(context, listen: false)
              .changeCurrentIndex(index);
        },
      ),
    );
  }
}
