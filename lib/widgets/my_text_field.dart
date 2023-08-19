// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:my_chat/constants.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String hint;
  IconData icon;
  bool scureText;
  String? Function(String?)? validate;
  MyTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hint,
    required this.icon,
    required this.scureText,
    required this.validate,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool visible;
  @override
  void initState() {
    visible = widget.scureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validate,
      obscureText: visible,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      cursorColor: kPrinmaryColor,
      decoration: InputDecoration(
          suffixIcon: widget.scureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  icon: Icon(visible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined))
              : null,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrinmaryColor, width: 0.5)),
          focusColor: kPrinmaryColor,
          hintText: widget.hint,
          prefixIcon: Icon(
            widget.icon,
            color: kPrinmaryColor,
          )),
    );
  }
}
