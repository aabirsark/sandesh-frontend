import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/universal%20widget/message_box.dart';
import 'package:sandesh/meta/views/chats/widgets/msg_card.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key, required this.chatInfo}) : super(key: key);

  final Chats chatInfo;

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
              itemCount: chatInfo.chats.length,
              itemBuilder: (context, index) {
                var data = chatInfo.chats[index];
                return data.username == UserDataDB.username
                    ? SenderMessageCard(
                        msg: data.message ?? "",
                        time: data.time ?? "",
                        senderName: data.username ?? "")
                    : ReciverMessageCard(
                        msg: data.message ?? "",
                        time: data.time ?? "",
                        senderName: data.username ?? "");
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
      title: Text(chatInfo.username ?? "",
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
