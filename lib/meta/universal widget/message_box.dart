
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/contants.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key, this.onSend, this.controller}) : super(key: key);

  final VoidCallback? onSend;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      constraints: const BoxConstraints(
        minHeight: 60,
        maxHeight: 120,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.menu,
                size: 27,
              )),
          Expanded(
              child: TextFormField(
                  controller: controller,
                  scrollPhysics: const BouncingScrollPhysics(),
                  cursorColor: primaryColor,
                  maxLines: null,
                  keyboardAppearance: Brightness.dark,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      hintText: "Type a msg..."))),
          IconButton(
              onPressed: () {
                onSend!();
                controller?.clear();
              },
              icon: SvgPicture.asset(
                logoPathSVG,
                color: primaryColor,
              ))
        ],
      ),
    );
  }
}
