import 'package:flutter/material.dart';
import 'package:my_chat/controllers/authData.dart';
import 'package:my_chat/screens/login.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  static const id = '/mainScreen';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Provider.of<AuthData>(context).user!.email!),
          ElevatedButton(
              onPressed: () {
                Provider.of<AuthData>(context,listen: false).signout();
                Navigator.pushReplacementNamed(context, LoginScreen.id);
              },
              child: Text('signout'))
        ],
      )),
    );
  }
}
