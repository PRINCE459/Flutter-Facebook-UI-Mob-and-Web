import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_for_web_and_mob/models/user_model.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  CreatePostContainer({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Container(
      margin: EdgeInsets.symmetric( horizontal: isDesktop ? 5.0 : 0.0 ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isDesktop ? BorderRadius.circular(5.0) : BorderRadius.circular(0.0),
        boxShadow: isDesktop ? [BoxShadow( color: Colors.black12, offset: Offset(0,2), blurRadius: 4.0 )] : null,
      ),
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8.0,),
              Expanded( child: TextField(decoration: InputDecoration.collapsed(hintText: "What's on your mind?"),)),
            ],
          ),
          const Divider( height: 10.0, thickness: 0.5, color: Colors.grey, ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(onPressed: () => print("Live Button Pressed") , icon: Icon(Icons.videocam, color: Colors.red,), label: Text("Live")),
                const VerticalDivider(width: 5.0, thickness: 0.5, ),
                FlatButton.icon(onPressed: () => print("Photo Gallery Button Pressed") , icon: Icon(Icons.photo_library, color: Colors.green,), label: Text("Photo")),
                const VerticalDivider(width: 5.0, thickness: 0.5, ),
                FlatButton.icon(onPressed: () => print("Rooms Button Pressed") , icon: Icon(Icons.video_call, color: Colors.purple,), label: Text("Rooms")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
