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
import 'package:sandesh/meta/views/rooms/rooms_info.dart';
import 'package:sandesh/meta/views/rooms/widgets/room_msg_detail.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_indi.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_model.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key? key, required this.roomCode}) : super(key: key);

  final String roomCode;

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  late RoomsModel roomInfo;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    roomInfo = Boxes.getRoom(widget.roomCode);
  }

  onTap() {
    if (controller.text.isNotEmpty) {
      RoomIndi msg = RoomIndi()
        ..roomCode = widget.roomCode
        ..date = DateFormates.currentDate()
        ..time = DateFormates.currentTime()
        ..username = UserDataDB.username
        ..message = controller.text;

      SocketClient.sendRoomMessage(controller.text, widget.roomCode);

      SocketDatabaseAgreement.updateRoom(widget.roomCode, msg);
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
              controller: controller,
              onSend: onTap,
            ),
            Expanded(
              child: ValueListenableBuilder<Box<RoomsModel>>(
                valueListenable: Boxes.roomBox.listenable(),
                builder: (_, value, __) {
                  return ListView.builder(
                    itemCount: roomInfo.chats.length,
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    itemBuilder: (context, index) {
                      var msg = roomInfo.chats.reversed.toList()[index];
                      return RoomsMsgCard(
                          name: msg.username ?? "",
                          message: msg.message ?? "",
                          time: msg.time ?? "");
                    },
                  );
                },
              ),
            )
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
      title: Text(roomInfo.roomName ?? "",
          maxLines: 1,
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 18)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
              onPressed: ()  {
                context.navigateTo(RoomInfoPage(
                  roomInfo: roomInfo,
                ));
                
              },
              icon: const Icon(Iconsax.info_circle)),
        )
      ],
    );
  }
}
