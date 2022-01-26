import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/details.ext.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/join/new%20and%20join%20room%20page/new_room.dart';
import 'package:sandesh/meta/views/join/new%20and%20join%20room%20page/widgets/local_users.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join"),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron),
          onPressed: () {
            context.navigateBack();
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.search_normal))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * .065,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      JoinButtons(
                          width: constraints.maxWidth * 0.4,
                          icon: CupertinoIcons.add,
                          onTap: () {
                            context.navigateTo(const CreateNewRoom());
                          },
                          label: "New room"),
                      JoinButtons(
                          width: constraints.maxWidth * 0.4,
                          icon: CupertinoIcons.person_2,
                          onTap: () {},
                          label: "Join joom"),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: LocalUsers())
          ],
        ),
      ),
    );
  }
}

class JoinButtons extends StatelessWidget {
  const JoinButtons(
      {Key? key,
      required this.width,
      required this.icon,
      required this.label,
      required this.onTap})
      : super(key: key);

  final double width;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: FittedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
