import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/universal%20widget/message_box.dart';
import 'package:sandesh/meta/views/rooms/widgets/room_msg_detail.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            const MessageBox(),
            Expanded(
                child: ListView.builder(
              itemCount: _data.length,
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemBuilder: (context, index) {
                var msg = _data[index];
                return RoomsMsgCard(
                    name: msg.name, message: msg.message, time: msg.time);
              },
            ))
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.navigateBack();
          },
          icon: const Icon(CupertinoIcons.left_chevron)),
      centerTitle: false,
      title: Text(title,
          maxLines: 1,
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 18)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
              onPressed: () {}, icon: const Icon(Iconsax.info_circle)),
        )
      ],
    );
  }
}

class _Tempdata {
  final String name;
  final String time;
  final String message;

  const _Tempdata(
      {required this.message, required this.time, required this.name});
}

List<_Tempdata> _data = const [
  _Tempdata(
      message: "Hello? How it's been Going",
      time: "6:39",
      name: "Aabir Sarkar"),
  _Tempdata(
      message: "fine!! what about you?", time: "6:39", name: "Kaveri Sarkar"),
  _Tempdata(message: "Alive...", time: "6:39", name: "Aabir Sarkar"),
  _Tempdata(
      message: ":->> me also still breathing",
      time: "6:39",
      name: "Kaveri Sarkar"),
  _Tempdata(
      message:
          "Good... Well come home one day, Grandma was remembring you and me too... never met since a while...",
      time: "6:39",
      name: "Aabir Sarkar"),
  _Tempdata(
      message: "I'll try... I was quite busy during this days",
      time: "6:39",
      name: "Kaveri Sarkar"),
  _Tempdata(
      message: "Now how's your buisness?", time: "6:39", name: "Aabir Sarkar"),
  _Tempdata(
      message: "I reckon everything fine now...",
      time: "6:39",
      name: "Aabir Sarkar"),
  _Tempdata(
      message: "Try to take a leave please",
      time: "6:39",
      name: "Aabir Sarkar"),
  _Tempdata(
      message: "Yaa I requested the Boss", time: "6:39", name: "Kaveri Sarkar"),
  _Tempdata(
      message: "just waiting for his reply",
      time: "6:39",
      name: "Kaveri Sarkar"),
  _Tempdata(
      message: "Okay! bye son talk you later",
      time: "6:39",
      name: "Kaveri Sarkar"),
].reversed.toList();
