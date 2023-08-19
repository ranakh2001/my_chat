import 'package:flutter/material.dart';
import 'package:my_chat/controllers/authData.dart';
import 'package:my_chat/screens/login.dart';
import 'package:my_chat/screens/main_screen.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<AuthData>(context).authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return LoginScreen();
          }
        });
  }
}
