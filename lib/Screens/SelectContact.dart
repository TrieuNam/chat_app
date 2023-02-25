import 'package:chap_app/CustomUI/ButtonCard.dart';
import 'package:chap_app/CustomUI/ContactCard.dart';
import 'package:chap_app/Model/ChatModel.dart';
import 'package:chap_app/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel("Dev South Million", "A full stack developer"),
      ChatModel("Dev Nam Trieu", "Flutter developer"),
      ChatModel("Dev Hanh Duyen", "QC developer"),
      ChatModel("Dev ", "App developer"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "2007 contact",
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
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Invite a friend"),
                value: "Invite a friend",
              ),
              PopupMenuItem(
                child: Text("Contact"),
                value: "Contact",
              ),
              PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          }),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, indext) {
            if (indext == 0) {
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(name: "New Group", icon: Icons.group));
            } else if (indext == 1) {
              return ButtonCard(name: "New Contact", icon: Icons.person_add);
            }
            return ContacCard(contact: contacts[indext - 2]);
          }),
    );
  }
}
