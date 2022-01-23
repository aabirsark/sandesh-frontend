import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';

class CreateNewRoom extends StatelessWidget {
  const CreateNewRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.navigateBack();
            },
            icon: const Icon(CupertinoIcons.left_chevron)),
      ),
    );
  }
}
