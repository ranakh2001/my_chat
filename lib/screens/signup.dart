import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/constants.dart';
import 'package:my_chat/controllers/authData.dart';
import 'package:my_chat/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

import '../widgets/logo_widget.dart';
import '../widgets/my_elevated_button.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  static const id = '/signUpScreen';
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

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
                scureText: false,
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter the email";
                  } else if (!EmailValidator.validate(val)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                hint: 'Username',
                icon: Icons.person_outline,
                scureText: false,
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter your user name";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                hint: 'Phone number',
                icon: Icons.phone_rounded,
                scureText: false,
                validate: (val) {
                  if (val!.isEmpty) {
                    return "Please enter your phone number";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                hint: 'password',
                icon: Icons.key,
                scureText: true,
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter your pssword";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: MyTextField(
                controller: password2Controller,
                keyboardType: TextInputType.visiblePassword,
                hint: 'Re-write password',
                icon: Icons.key,
                scureText: true,
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter your password";
                  } else if (val != passwordController.text) {
                    return "Verify the entered password";
                  } else {
                    return null;
                  }
                },
              ),
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
