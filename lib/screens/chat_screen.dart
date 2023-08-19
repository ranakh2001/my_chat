import 'package:flutter/material.dart';
import 'package:my_chat/constants.dart';

import '../widgets/message_textField.dart';

class ChatScreen extends StatelessWidget {
  static const id = '/chatScreen';
  TextEditingController controller = TextEditingController();
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrinmaryColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "John",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Typing...",
                style: TextStyle(color: kSecondryColor, fontSize: 16),
              )
            ],
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: kPrinmaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            child: const Text(
              "Hello",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              children: [
                Expanded(child: MessageTextField(controller: controller)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrinmaryColor,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(16)),
                    onPressed: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
