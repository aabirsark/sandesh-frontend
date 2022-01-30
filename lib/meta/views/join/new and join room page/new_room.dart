import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:sandesh/app/api/room_api_calls.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/database/boxes.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/app/extension/details.ext.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/join/new%20and%20join%20room%20page/widgets/custom_input_field.join_page.dart';
import 'package:sandesh/model/core/util%20provider/load_up.provider.dart';
import 'package:sandesh/model/database/rooms%20model/rooms_model.dart';
import 'package:sandesh/model/rooms/room_res.model.dart';
import 'package:sandesh/model/rooms/rooms_model.dart';

class CreateNewRoom extends StatefulWidget {
  const CreateNewRoom({Key? key}) : super(key: key);

  @override
  State<CreateNewRoom> createState() => _CreateNewRoomState();
}

class _CreateNewRoomState extends State<CreateNewRoom> {
  late TextEditingController _roomnameController;
  late TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _roomnameController = TextEditingController();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    _roomnameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              Container(
                height: context.screenHeight * 0.1,
                width: context.screenHeight * 0.1,
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
                style: TextStyle(fontSize: context.screenHeight * 0.035),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              CustomJoinPageInputField(
                label: "Room Name",
                controller: _roomnameController,
              ),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              CustomJoinPageInputField(
                label: "Secret Code",
                controller: _codeController,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Secret Code should be unique\nIt's used to join room",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: context.screenHeight * 0.06,
              ),
              GestureDetector(
                onTap: () async {
                  if (!context.read<LoadUpProvider>().loading) {
                    if (_codeController.text.isNotEmpty ||
                        _roomnameController.text.isNotEmpty) {
                      context.read<LoadUpProvider>().changeLoadingState();
                      RoomPushModel model = RoomPushModel(
                          roomName: _roomnameController.text,
                          code: _codeController.text,
                          adminUsername: UserDataDB.username,
                          adminPhone: UserDataDB.phone);

                      // ? compute method on different thread

                      RoomResModel res =
                          await compute(RoomApiService.createRoom, model);

                      if (res.error ?? true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            res.feedback ?? "Something Bad happend",
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.redAccent,
                          behavior: SnackBarBehavior.floating,
                        ));
                      } else if (!(res.error ?? false)) {
                        final RoomsModel model = RoomsModel()
                          ..roomName = res.data?.roomname
                          ..code = res.data?.code
                          ..adminName = res.data?.adminName;

                        Box box = Boxes.roomBox;
                        await box.put(_codeController.text, model);

                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "All fields are required",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  }
                },
                child: Container(
                  height: context.screenHeight * 0.08,
                  width: context.screenWidth * 0.8,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: !context.watch<LoadUpProvider>().loading
                          ? const Text(
                              "Join Room",
                              style: TextStyle(fontSize: 20),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
