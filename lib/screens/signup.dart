import 'package:flutter/material.dart';
import 'package:my_chat/constants.dart';
import 'package:my_chat/controllers/authData.dart';
import 'package:my_chat/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

import '../widgets/logo_widget.dart';
import '../widgets/my_elevated_button.dart';

class SignUpScreen extends StatefulWidget {
  static const id = '/signUpScreen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController phoneController;

  late TextEditingController passwordController;
  late TextEditingController password2Controller;
  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kPrinmaryColor,
          ),
        ),
        title: Text(
          'SignUp',
          style: TextStyle(fontSize: 20, color: kPrinmaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: LogoWidget(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hint: 'email',
                  icon: Icons.person_outline,
                  scureText: false),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  hint: 'Username',
                  icon: Icons.person_outline,
                  scureText: false),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  hint: 'Phone number',
                  icon: Icons.phone_rounded,
                  scureText: false),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  hint: 'password',
                  icon: Icons.key,
                  scureText: true),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                  controller: password2Controller,
                  keyboardType: TextInputType.visiblePassword,
                  hint: 'Re-write password',
                  icon: Icons.key,
                  scureText: true),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: MyElevatedButton(
                function: () async {
                  await Provider.of<AuthData>(context, listen: false)
                      .signUpWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                          phoneController.text,
                          nameController.text,
                          context);
                },
                title: 'Sign Up',
                bgColor: kPrinmaryColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
