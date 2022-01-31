import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/database/boxes.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/app/sockets/web_sockets.dart';
import 'package:sandesh/app/utils/date_tools.dart';
import 'package:sandesh/meta/universal%20widget/message_box.dart';
import 'package:sandesh/meta/views/chats/widgets/msg_card.dart';
import 'package:sandesh/model/database/chats%20model/chats_individual.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({
    Key? key,
    required this.username,
    this.phNumber,
    this.index,
  }) : super(key: key);

  final String username;
  final String? phNumber;
  final int? index;

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  Chats? chatInfo;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    setState(() {
      chatInfo = Boxes.getUser(widget.username);
    });

    super.initState();
  }

  onTap() {
    if (_messageController.text.isNotEmpty) {
      ChatIndi _msg = ChatIndi()
        ..username = UserDataDB.username
        ..message = _messageController.text
        ..date = DateFormates.currentDate()
        ..time = DateFormates.currentTime();
      if (chatInfo == null) {
        SocketDatabaseAgreement.createNewBaseAndAddMessage(
            widget.username, _msg, widget.phNumber);
        SocketClient.sendMessage(_messageController.text, widget.username);
        setState(() {
          chatInfo = Boxes.getUser(widget.username);
        });
      } else {
        SocketClient.sendMessage(_messageController.text, widget.username);

        SocketDatabaseAgreement.updateChats(widget.username, _msg);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            MessageBox(
              controller: _messageController,
              onSend: onTap,
            ),
            Expanded(
                child: chatInfo != null
                    ? ValueListenableBuilder<Box<Chats>>(
                        valueListenable: Boxes.chatBox.listenable(),
                        builder: (context, value, child) {
                          return ListView.builder(
                            reverse: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: chatInfo!.chats.length,
                            itemBuilder: (context, index) {
                              var data =
                                  chatInfo!.chats.reversed.toList()[index];
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
                          );
                        })
                    : Container())
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
      title: Text(widget.username,
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
