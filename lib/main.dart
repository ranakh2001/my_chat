import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/constants.dart';
import 'package:my_chat/controllers/chatData.dart';
import 'package:my_chat/screens/chat_screen.dart';
import 'package:my_chat/screens/loading_screen.dart';
import 'package:my_chat/screens/login.dart';
import 'package:my_chat/screens/main_screen.dart';
import 'package:my_chat/screens/signup.dart';
import 'package:provider/provider.dart';

import 'controllers/authData.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthData>(
      create: (context) => AuthData(),
      child: ChangeNotifierProvider<ChatData>(
        create: (context) => ChatData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kPrinmaryColor),
            useMaterial3: true,
          ),
          home: const LoadingScreen(),
          routes: {
            LoginScreen.id: (context) => LoginScreen(),
            SignUpScreen.id: (context) => SignUpScreen(),
            MainScreen.id: (context) => const MainScreen(),
            ChatScreen.id: (context) =>  ChatScreen()
          },
        ),
      ),
    );
  }
}
