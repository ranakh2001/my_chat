// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/screens/login.dart';
import 'package:my_chat/screens/main_screen.dart';

class AuthData extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  UserInfo? userInfo;
  Future<void> loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    print("login");
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      user = value.user;
      print(user!.email);
      Navigator.pushReplacementNamed(context, MainScreen.id);
    });
  }

  Future<void> signUpWithEmailAndPassword(String email, String password,
      String phoneNum, String userName, BuildContext context) async {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      user = value.user;
      print(user!.email);
      createUser({
        'userName': userName,
        'email': email,
        'phoneNum': phoneNum,
      });
      Navigator.pushReplacementNamed(context, MainScreen.id);
    });
  }

  Future<void> signout(BuildContext context) async {
    _auth.signOut().then((value) {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    });
  }

  Future<void> createUser(Map<String, dynamic> data) async {
    _firestore.collection('users').doc(user!.uid).set(data);
  }
}
