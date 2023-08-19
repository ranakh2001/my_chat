import 'package:flutter/material.dart';
import 'package:my_chat/constants.dart';

import '../widgets/my_FAB.dart';
import 'chat_screen.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: [
      NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25))),
                floating: true,
                backgroundColor: kPrinmaryColor,
                title: const Text(
                  "TalkTo.Me",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              )
            ];
          },
          body: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, ChatScreen.id),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[100],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              const Text(
                                "John",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Hello",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              "19/8/2023",
                              style: TextStyle(color: Colors.grey[400]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                );
              },
              itemCount: 10)),
      MyFAB(
        onTap: () {},
      ),
    ]);
  }
}
