import 'package:hive/hive.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/model/database/chats%20model/chats_model.dart';

class Boxes {
  static Box<Chats> chatBox = Hive.box<Chats>(chatBoxName);
}
