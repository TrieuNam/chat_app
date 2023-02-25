import 'package:chap_app/CustomUI/CustomCard.dart';
import 'package:chap_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel("South Million", "person.svg", false, "4:00", "Hi EveryOne"),
    ChatModel("Hanh Duyen", "person.svg", false, "10:00", "Hi South Million"),
    ChatModel(
        "Nam Trieu", "groups.svg", true, "3:00", "Hi EveryOne on this group"),
    ChatModel("Nam Dev", "person.svg", false, "5:00", "Hi EveryOne"),
    ChatModel("Nam 2", "groups.svg", true, "5:00", "Hi Nam Dev"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(chatModel: (chats[index])),
        ));
  }
}
