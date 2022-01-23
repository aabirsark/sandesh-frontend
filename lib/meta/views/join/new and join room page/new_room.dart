import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/details.ext.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/join/new%20and%20join%20room%20page/widgets/custom_input_field.join_page.dart';

class CreateNewRoom extends StatelessWidget {
  const CreateNewRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getHeight(double i) {
      print(i);
      return i;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.navigateBack();
            },
            icon: const Icon(CupertinoIcons.left_chevron)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              Container(
                height: getHeight(context.screenHeight * 0.1),
                width: getHeight(context.screenHeight * 0.1),
                decoration: const BoxDecoration(
                    color: Colors.white10, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    CupertinoIcons.person_2,
                    color: primaryColor,
                    size: context.screenHeight * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              Text(
                "Create New Room",
                style: TextStyle(
                    fontSize: getHeight(context.screenHeight * 0.035)),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              CustomJoinPageInputField(label: "Room Name"),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              CustomJoinPageInputField(label: "Room Desc (Optional)"),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              CustomJoinPageInputField(label: "Secret Code"),
              SizedBox(
                height: context.screenHeight * 0.06,
              ),
              Container(
                height: context.screenHeight * 0.08,
                width: context.screenWidth * 0.8,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Create Room",
                  style: TextStyle(fontSize: 18),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
