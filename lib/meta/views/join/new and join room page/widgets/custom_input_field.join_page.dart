import 'package:flutter/material.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/details.ext.dart';

class CustomJoinPageInputField extends StatelessWidget {
  const CustomJoinPageInputField(
      {Key? key, this.controller, required this.label})
      : super(key: key);

  final TextEditingController? controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * .08,
      width: context.screenWidth * .8,
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * .05,
      ),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          cursorColor: primaryColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 18)),
        ),
      ),
    );
  }
}
