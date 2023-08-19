import 'package:flutter/material.dart';

import '../screens/chats.dart';
import '../screens/profile.dart';

class ChatData extends ChangeNotifier {
  int currentindex = 0;
  final List<Widget> tabs = const [
    ChatsView(),
    ProfileView(),
  ];

  changeCurrentIndex(int index) {
    currentindex = index;
    notifyListeners();
  }
}
