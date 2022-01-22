import 'package:flutter/material.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/details.ext.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    getHeight(double height) {
      print(height);
      return height;
    }

    return Container(
      height: 60,
      // height: 60,
      width: context.screenWidth * 0.8 < 315 ? context.screenWidth * .8 : 315,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          FittedBox(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            obscureText: label == "Password" ? true : false,
            keyboardType: label == "Phone no."
                ? TextInputType.phone
                : TextInputType.visiblePassword,
            cursorColor: primaryColor,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                hintStyle:
                    const TextStyle(color: Colors.white38, fontSize: 18)),
          ))
        ],
      ),
    );
  }
}
