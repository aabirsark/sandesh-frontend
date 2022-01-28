import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/chats/chats_page.dart';
import 'package:sandesh/model/database/chats%20model/chats_individual.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({Key? key, required this.chatInfo, required this.index})
      : super(key: key);

  final int index;
  final Chats chatInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.navigateTo(ChatsPage(
          username: chatInfo.username!,
          index: index,
        ));
      },
      // tileColor: Colors.white10,
      leading: CircleAvatar(
        child: Text(
          chatInfo.username!.substring(0, 1),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
        radius: 23,
        backgroundColor: Colors.white10,
      ),
      title: Text(
        chatInfo.username ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18),
      ),
      // subtitle: Row(
      //   children: const [
      //     Icon(
      //       CupertinoIcons.chat_bubble,
      //       color: primaryColor,
      //       size: 20,
      //     ),
      //     SizedBox(
      //       width: 5,
      //     ),
      //     Text(
      //       "New Chat...",
      //       style: TextStyle(color: primaryColor),
      //     ),
      //   ],
      // ),
      subtitle: Text(chatInfo.chats[chatInfo.chats.length - 1].message ?? ""),
      trailing: Text(
        chatInfo.chats[chatInfo.chats.length - 1].date ?? "",
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}
