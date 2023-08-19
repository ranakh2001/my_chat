// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/screens/main_screen.dart';

class AuthData extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;
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
        'id': user!.uid,
        'userName': userName,
        'email': email,
        'phoneNum': phoneNum,
      });
      Navigator.pushReplacementNamed(context, MainScreen.id);
    });
  }

  Future<void> signout() async {
    _auth.signOut();
    print("signout succrssfuly");
  }

  Future<void> createUser(Map<String, dynamic> data) async {
    _firestore.collection('users').add(data);
  }
}
