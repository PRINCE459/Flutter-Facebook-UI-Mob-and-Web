import 'package:facebook_for_web_and_mob/models/models.dart';
import 'package:facebook_for_web_and_mob/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User usr;
  final String name;
  UserCard({required this.usr, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("Profile Avatar Button Is Pressed :)"),
      child: Row(
        children: [
         ProfileAvatar(imageUrl: usr.imageUrl),
         SizedBox(width: 5.0,),
         Text(name, overflow: TextOverflow.ellipsis, ),
        ],
      ),
    );
  }
}
