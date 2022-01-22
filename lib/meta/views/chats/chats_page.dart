import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/universal%20widget/message_box.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: const [MessageBox()],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.navigateBack();
          },
          icon: const Icon(CupertinoIcons.left_chevron)),
      centerTitle: false,
      title: Text(title,
          maxLines: 1,
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 18)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(onPressed: () {}, icon: const Icon(Iconsax.call)),
        )
      ],
    );
  }
}
