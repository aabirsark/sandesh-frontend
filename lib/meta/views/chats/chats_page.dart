import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/universal%20widget/message_box.dart';
import 'package:sandesh/meta/views/chats/widgets/msg_card.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key, required this.title}) : super(key: key);

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
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemCount: _data.length,
              itemBuilder: (context, index) {
                var data = _data[index];
                return data.name == "Aabir Sarkar"
                    ? SenderMessageCard(
                        msg: data.message,
                        time: data.time,
                        senderName: data.name)
                    : ReciverMessageCard(
                        msg: data.message,
                        time: data.time,
                        senderName: data.name);
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
          child: IconButton(onPressed: () {}, icon: const Icon(Iconsax.call)),
        )
      ],
    );
  }
}

class Tempdata {
  final String name;
  final String time;
  final String message;

  const Tempdata(
      {required this.message, required this.time, required this.name});
}

List<Tempdata> _data = const [
  Tempdata(
      message: "Hello? How it's been Going",
      time: "6:39",
      name: "Aabir Sarkar"),
  Tempdata(
      message: "fine!! what about you?", time: "6:39", name: "Kaveri Sarkar"),
  Tempdata(message: "Alive...", time: "6:39", name: "Aabir Sarkar"),
  Tempdata(
      message: ":->> me also still breathing",
      time: "6:39",
      name: "Kaveri Sarkar"),
  Tempdata(
      message:
          "Good... Well come home one day, Grandma was remembring you and me too... never met since a while...",
      time: "6:39",
      name: "Aabir Sarkar"),
  Tempdata(
      message: "I'll try... I was quite busy during this days",
      time: "6:39",
      name: "Kaveri Sarkar"),
  Tempdata(
      message: "Now how's your buisness?", time: "6:39", name: "Aabir Sarkar"),
  Tempdata(
      message: "I reckon everything fine now...",
      time: "6:39",
      name: "Aabir Sarkar"),
  Tempdata(
      message: "Try to take a leave please",
      time: "6:39",
      name: "Aabir Sarkar"),
  Tempdata(
      message: "Yaa I requested the Boss", time: "6:39", name: "Kaveri Sarkar"),
  Tempdata(
      message: "just waiting for his reply",
      time: "6:39",
      name: "Kaveri Sarkar"),
  Tempdata(
      message: "Okay! bye son talk you later",
      time: "6:39",
      name: "Kaveri Sarkar"),
].reversed.toList();
