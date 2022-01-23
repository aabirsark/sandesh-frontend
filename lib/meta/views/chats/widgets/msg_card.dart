// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/details.ext.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard(
      {Key? key,
      required this.msg,
      required this.time,
      required this.senderName})
      : super(key: key);

  final String msg;
  final String time;
  final String senderName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              time,
              style: TextStyle(
                  color: Colors.grey, fontSize: context.screenWidth * .04),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            constraints: BoxConstraints(
              maxWidth: context.screenWidth * 0.65,
            ),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(10),
                    bottomLeft: const Radius.circular(20))),
            child: Text(
              msg,
              style: const TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}

class ReciverMessageCard extends StatelessWidget {
  const ReciverMessageCard(
      {Key? key,
      required this.msg,
      required this.time,
      required this.senderName})
      : super(key: key);

  final String msg;
  final String time;
  final String senderName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            constraints: BoxConstraints(
              maxWidth: context.screenWidth * 0.65,
            ),
            decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: const BorderRadius.only(
                    topRight: const Radius.circular(20),
                    topLeft: const Radius.circular(10),
                    bottomRight: const Radius.circular(20))),
            child: Text(
              msg,
              style: const TextStyle(fontSize: 17),
            ),
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
