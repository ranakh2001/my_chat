// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_chat/constants.dart';

// ignore: must_be_immutable
class MessageTextField extends StatelessWidget {
  TextEditingController controller;
  int maxLines = 1;
  MessageTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      minLines: 1,
      maxLines: 10,
      onChanged: (text) {},
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: kSecondryColor))),
    );
  }
}
