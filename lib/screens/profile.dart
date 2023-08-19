import 'package:flutter/material.dart';
import 'package:my_chat/controllers/authData.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Provider.of<AuthData>(context, listen: false).signout(context);
          },
          child: const Text("SignOut")),
    );
  }
}
