import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/chats/chats_page.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile(
      {Key? key,
      required this.title,
      required this.lastMessage,
      required this.lastMessaged})
      : super(key: key);

  final String title;
  final String lastMessage;
  final String lastMessaged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.navigateTo(ChatsPage(title: title));
      },
      // tileColor: Colors.white10,
      leading: const CircleAvatar(
        child: Text(
          "A",
          style: TextStyle(color: Colors.white),
        ),
        radius: 23,
        backgroundColor: Colors.white10,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Row(
        children: const [
          Icon(
            CupertinoIcons.chat_bubble,
            color: primaryColor,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "New Chat...",
            style: TextStyle(color: primaryColor),
          ),
        ],
      ),
      trailing: Text(
        lastMessaged,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}
