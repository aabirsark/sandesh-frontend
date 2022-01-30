import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/app/sockets/web_sockets.dart';
import 'package:sandesh/meta/views/home/views/chats/chats_view.dart';
import 'package:sandesh/meta/views/home/views/rooms/rooms_view.dart';
import 'package:sandesh/meta/views/join/join_page.dart';
import 'package:sandesh/model/core/home%20provider/home.provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SocketClient.connectSocket();
    SocketClient.addChatsListeners();
    SocketClient.joinRooms();
  }

  @override
  void dispose() {
    // socket.disconnect();
    SocketClient.disconnectSocket();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            logoPathSVG,
            color: primaryColor,
            height: 35,
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Iconsax.user)),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                    onPressed: () {
                      context.navigateTo(const JoinPage());
                    },
                    icon: const Icon(Iconsax.add_square)))
          ],
        ),
        body: AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          child: context.watch<HomeStateProvider>().chatPage == "Chats"
              ? const ChatsView()
              : const RoomView(),
        ),
        bottomNavigationBar: const HomeBottomBar());
  }
}

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _tabs.map((tab) => TabButton(tab: tab)).toList(),
              ),
            ),
          ),
        ));
  }
}

class Tabs {
  String label;
  IconData icon;

  Tabs({
    required this.label,
    required this.icon,
  });
}

List<Tabs> _tabs = [
  Tabs(
    label: "Chats",
    icon: CupertinoIcons.chat_bubble,
  ),
  Tabs(
    label: "Rooms",
    icon: CupertinoIcons.person_2,
  ),
];

class TabButton extends StatelessWidget {
  const TabButton({Key? key, required this.tab}) : super(key: key);

  final Tabs tab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (tab.label != context.read<HomeStateProvider>().chatPage) {
          context.read<HomeStateProvider>().changePageState(tab.label);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        // width: 100,
        decoration: BoxDecoration(
            color: context.watch<HomeStateProvider>().chatPage == tab.label
                ? Colors.black
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Row(
          children: [
            Icon(tab.icon),
            const SizedBox(
              width: 10,
            ),
            Text(tab.label),
          ],
        )),
      ),
    );
  }
}
