import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sandesh/app/api/room_api_calls.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/details.ext.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_model.dart';
import 'package:sandesh/model/rooms/room_participants.res.model.dart';

class RoomInfoPage extends StatelessWidget {
  const RoomInfoPage({Key? key, required this.roomInfo}) : super(key: key);

  final RoomsModel roomInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.navigateBack();
            },
            icon: const Icon(CupertinoIcons.left_chevron)),
        title: const Text("Room Info"),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: ListTile(
              title: const Text("Admin username :"),
              trailing: Text(roomInfo.adminName ?? ""),
            ),
          ),
          Container(
            width: context.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.double_arrow_rounded,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Exit Room",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            children: const [
              SizedBox(
                width: 25,
              ),
              Icon(
                CupertinoIcons.person_2,
                color: primaryColor,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Participants",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Expanded(child: _ParticipantsList(roomInfo: roomInfo))
        ],
      ),
    );
  }
}

class _ParticipantsList extends StatelessWidget {
  const _ParticipantsList({
    Key? key,
    required this.roomInfo,
  }) : super(key: key);

  final RoomsModel roomInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<RoomParticipantsResModel>(
        future: RoomApiService.getRoomParticipants(roomInfo.code ?? ""),
        builder: (context, snapshot) {
          RoomParticipantsResModel? data;
          if (snapshot.hasData) {
            data = snapshot.data;
          }
          return data == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: data.data.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          data!.data
                              .elementAt(index)
                              .username!
                              .substring(0, 1)
                              .toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                        radius: 23,
                        backgroundColor: Colors.white10,
                      ),
                      title: Text(data.data.elementAt(index).username ?? ""),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
