import 'package:flutter/material.dart';
import 'package:sandesh/meta/views/home/views/chats/widgets/chatsview_listtile.widget.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: ChatListTile(
            title: "Aabir Sarkar",
            lastMessage: "How's job going?",
            lastMessaged: "24/01/22"),
      ),
    );
  }
}
