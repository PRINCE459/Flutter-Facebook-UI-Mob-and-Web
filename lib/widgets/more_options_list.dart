import 'package:facebook_for_web_and_mob/config/palette.dart';
import 'package:facebook_for_web_and_mob/models/models.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final User currentUser;
  MoreOptionsList({required this.currentUser});
  @override

  final List<List> _moreOptionsLists = [
    [MdiIcons.shieldAccount, Colors.deepPurple, "COVID-19 Info Center"],
    [MdiIcons.accountMultiple, Colors.cyan, "Friends"],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, "Messenger"],
    [MdiIcons.flag, Colors.orange, "Pages"],
    [MdiIcons.storefront, Palette.facebookBlue, "MarketPlace"],
    [Icons.ondemand_video, Palette.facebookBlue, "Watch"],
    [MdiIcons.calendarStar, Colors.red, "Events"],
  ];

  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: ListView.builder(
        itemCount: _moreOptionsLists.length + 1,
          itemBuilder: (context, index){
            if(index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: UserCard(usr: currentUser, name: currentUser.name,),
              );
            }
            final List option = _moreOptionsLists[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: _Options(icon: option[0], color: option[1], label: option[2]),
            );
          }
      ),
    );
  }
}


class _Options extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  _Options({required this.icon, required this.color, required this.label});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          Icon(icon, size: 35.0, color: color,),
          SizedBox(width: 5.0,),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
