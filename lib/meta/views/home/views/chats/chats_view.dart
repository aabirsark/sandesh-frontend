import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sandesh/app/database/boxes.dart';
import 'package:sandesh/meta/views/home/views/chats/widgets/chatsview_listtile.widget.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Chats>>(
        valueListenable: Boxes.chatBox.listenable(),
        builder: (context, value, child) {
          var data = value.values.cast<Chats>().toList();
        

          return data.isNotEmpty
              ? ListView.builder(
                  itemCount: data.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ChatListTile(
                      chatInfo: data.elementAt(index),
                      index: index,
                    ),
                  ),
                )
              : const Center(
                  child: Text("No Chats!"),
                );
        });
  }
}
