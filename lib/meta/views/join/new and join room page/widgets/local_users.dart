import 'package:flutter/material.dart';
import 'package:sandesh/app/api/auth_api_calls.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/model/auth/auth_response_model.dart';

class LocalUsers extends StatefulWidget {
  const LocalUsers({Key? key}) : super(key: key);

  @override
  State<LocalUsers> createState() => _LocalUsersState();
}

class _LocalUsersState extends State<LocalUsers> {
  List<UserData> users = [];

  @override
  void initState() {
    setAllUsers();
    super.initState();
  }

  setAllUsers() async {
    var _users = await AuthApi.getAllUsers();
    users.addAll(_users.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return users.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          )
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: Text(
                  users[index].username!.substring(0, 1),
                  style: const TextStyle(color: Colors.white),
                ),
                radius: 23,
                backgroundColor: Colors.white10,
              ),
              title: Text(
                users[index].username ?? "",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
  }
}
