import 'package:chap_app/CustomUI/ButtonCard.dart';
import 'package:chap_app/CustomUI/ContactCard.dart';
import 'package:chap_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel("Dev South Million", "A full stack developer"),
    ChatModel("Dev Nam Trieu", "Flutter developer"),
    ChatModel("Dev Hanh Duyen", "QC developer"),
    ChatModel("Dev ", "App developer"),
  ];

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add participants",
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, indext) {
            return InkWell(
                onTap: () {
                  if (contacts[indext].select == false) {
                    setState(() {
                      contacts[indext].select = true;
                      groups.add(contacts[indext]);
                    });
                  } else {
                    setState(() {
                      contacts[indext].select = false;
                      groups.remove(contacts[indext]);
                    });
                  }
                },
                child: ContacCard(contact: contacts[indext]));
          }),
    );
  }
}
