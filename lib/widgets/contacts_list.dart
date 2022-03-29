import 'package:facebook_for_web_and_mob/models/models.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final  List<User> users;
  ContactsList({required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Contacts"),
              Row(
                children: [
                  Icon(Icons.search, size: 20.0,),
                  SizedBox(width: 5.0,),
                  Icon(Icons.more_horiz, size: 20.0,),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Expanded(
            child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index){
                  final User usr = users[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: UserCard(usr: usr, name: usr.name),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
