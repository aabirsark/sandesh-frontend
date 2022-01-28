import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sandesh/app/database/boxes.dart';
import 'package:sandesh/meta/views/home/views/rooms/widgets/roomview_listtile.widget.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_model.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<RoomsModel>>(
        valueListenable: Boxes.roomBox.listenable(),
        builder: (context, value, child) {
          var data = value.values.cast<RoomsModel>().toList();

          return data.isNotEmpty
              ? ListView.builder(
                  itemCount: data.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: RoomViewListTile(
                      chatInfo: data.elementAt(index),
                    ),
                  ),
                )
              : const Center(
                  child: Text("No Rooms!"),
                );
        });
  }
}
