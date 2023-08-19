import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/constants.dart';
import 'package:my_chat/controllers/authData.dart';
import 'package:my_chat/screens/signup.dart';
import 'package:provider/provider.dart';

import '../widgets/logo_widget.dart';
import '../widgets/my_elevated_button.dart';
import '../widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LogoWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: MyTextField(
                  controller: emailController,
                  hint: 'E-mail',
                  icon: Icons.person_outline,
                  keyboardType: TextInputType.emailAddress,
                  scureText: false,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: MyTextField(
                  controller: passwordController,
                  hint: 'Password',
                  icon: Icons.key,
                  keyboardType: TextInputType.emailAddress,
                  scureText: true,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "I forgot my password!",
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.black),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: MyElevatedButton(
                  function: () async {
                    // await Provider.of<AuthData>(context,listen: false)
                    //     .loginWithEmailAndPassword(emailController.text,
                    //         passwordController.text, context);
                    Provider.of<AuthData>(context,listen: false).signout();
                  },
                  title: 'Sign In',
                  bgColor: kPrinmaryColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                ),
              ),
              const Text(
                "Or sign in with",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                child: Row(
                  children: [
                    Expanded(
                      child: MyElevatedButton(
                          function: () {},
                          textcolor: Colors.black,
                          title: 'Facebook',
                          bgColor: kSecondryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32))),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: MyElevatedButton(
                          function: () {},
                          textcolor: Colors.black,
                          title: 'Google',
                          bgColor: kSecondryColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(32),
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32))),
                    ),
                  ],
                ),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Don\'t have account ? ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, SignUpScreen.id);
                              },
                            text: 'Sign Up',
                            style: TextStyle(color: kPrinmaryColor))
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
