import 'package:chap_app/CustomUI/AvataCard.dart';
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
      body: Stack(
        children: [
          Container(
            child: ListView.builder(
                itemCount: contacts.length+1,
                itemBuilder: (context, indext) {
                  if (indext == 0) {
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      if (contacts[indext-1].select == false) {
                        setState(() {
                          contacts[indext-1].select = true;
                          groups.add(contacts[indext-1]);
                        });
                      } else {
                        setState(() {
                          contacts[indext-1].select = false;
                          groups.remove(contacts[indext-1]);
                        });
                      }
                    },
                    child: ContacCard(contact: contacts[indext-1]),
                  );
                }),
          ),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groups.remove(contacts[index]);
                                      contacts[index].select = false;
                                    });
                                  },
                                  child: AvataCard(contact: contacts[index]));
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
