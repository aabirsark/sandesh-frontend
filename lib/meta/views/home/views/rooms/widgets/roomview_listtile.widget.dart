
import 'package:flutter/material.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/rooms/rooms_page.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_model.dart';

class RoomViewListTile extends StatelessWidget {
  const RoomViewListTile({Key? key, required this.chatInfo}) : super(key: key);

  final RoomsModel chatInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.navigateTo(RoomsPage(
          title: chatInfo.roomName ?? "",
        ));
      },
      leading: CircleAvatar(
        child: Text(
          chatInfo.roomName!.substring(0, 1).toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
        radius: 23,
        backgroundColor: Colors.white10,
      ),
      title: Text(
        chatInfo.roomName ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18),
      ),
      // subtitle: Text(chatInfo.chats[chatInfo.chats.length].message ?? ""),
      subtitle: chatInfo.chats.isNotEmpty
          ? Text(
              chatInfo.chats[chatInfo.chats.length - 1].message ?? "",
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          : const Text(
              "Start Chatting !",
              style: TextStyle(color: primaryColor),
            ),
    );
  }
}
