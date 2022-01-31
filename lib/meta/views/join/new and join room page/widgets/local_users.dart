import 'package:flutter/material.dart';
import 'package:sandesh/app/api/auth_api_calls.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/chats/chats_page.dart';
import 'package:sandesh/model/auth/auth_response_model.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
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
              onTap: () {
                context.navigateTo(ChatsPage(
                  username: users[index].username!,
                  phNumber: users[index].phNumber!,
                ));
              },
              leading: CircleAvatar(
                child: Text(
                  users[index].username!.substring(0, 1).toUpperCase(),
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
