import 'package:facebook_for_web_and_mob/config/palette.dart';
import 'package:facebook_for_web_and_mob/models/models.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RoomBuilder extends StatelessWidget {
  final List<User> onlineUsers;
  RoomBuilder({required this.onlineUsers});

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
      height: 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: onlineUsers.length + 1,
          itemBuilder: (context, index) {
          if (index == 0) {
            return _CreateRoomBuilder();
          }
          User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true, ),
          );
          }
      ),
    );
  }
}

class _CreateRoomBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        borderSide: BorderSide(
          width: 3.0,
          color: Colors.lightBlue,
        ),
        onPressed: () => print("Create Room Button Pressed"),
        child: Row(
          children: [
            // To Apply Custom Gradient Colour Over Icon
            ShaderMask(  shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
            child: Icon(Icons.video_call, size: 30.0, color: Colors.white,)),
            SizedBox(width: 4.0,),
            Text("Create \n Room"),
          ],
        ),
      ),
    );
  }
}
