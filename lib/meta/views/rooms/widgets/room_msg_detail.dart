import 'package:flutter/material.dart';
import 'package:sandesh/app/extension/details.ext.dart';

class RoomsMsgCard extends StatelessWidget {
  const RoomsMsgCard(
      {Key? key, required this.name, required this.message, required this.time})
      : super(key: key);

  final String name;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  name,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                constraints: BoxConstraints(
                  maxWidth: context.screenWidth * 0.65,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(20))),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              time,
              style: TextStyle(
                  color: Colors.grey, fontSize: context.screenWidth * .04),
            ),
          ),
        ],
      ),
    );
  }
}
