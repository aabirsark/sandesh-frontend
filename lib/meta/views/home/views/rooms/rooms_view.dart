import 'package:flutter/material.dart';
import 'package:sandesh/meta/views/home/views/rooms/widgets/roomview_listtile.widget.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: RoomViewListTile(
            roomName: "Flutter Dev Channel",
            participants: 67,
            lastSeen: "21/01/22"),
      ),
    );
  }
}
