import 'package:flutter/material.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/rooms/rooms_page.dart';

class RoomViewListTile extends StatelessWidget {
  const RoomViewListTile(
      {Key? key,
      required this.roomName,
      required this.participants,
      required this.lastSeen})
      : super(key: key);

  final String roomName;
  final int participants;
  final String lastSeen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.navigateTo(RoomsPage(title: roomName));
      },
      leading: const CircleAvatar(
        child: Text(
          "F",
          style: TextStyle(color: Colors.white),
        ),
        radius: 23,
        backgroundColor: Colors.white10,
      ),
      title: Text(
        roomName,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text("$participants participants"),
      trailing: Text(
        lastSeen,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}
