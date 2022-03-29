import 'package:facebook_for_web_and_mob/config/palette.dart';
import 'package:facebook_for_web_and_mob/models/models.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUsr;
  final int index;
  final Function(int) onTap;

  CustomAppBar({required this.currentUsr, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,1),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text("facebook", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, letterSpacing: -1.2, color: Palette.facebookBlue),)),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              index: index,
              onTap: onTap,
              bottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(usr: currentUsr, name: "Justin Bieber",),
                SizedBox(width: 6.0,),
                CircleButton(icon: Icons.search, iconSize: 25.0, onPressed: () => print("Search Button Is Pressed :)")),
                CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 25.0, onPressed: () => print("FaceBook Messenger Button Is Pressed :)")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
