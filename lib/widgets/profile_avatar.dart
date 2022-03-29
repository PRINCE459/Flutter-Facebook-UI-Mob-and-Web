import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_for_web_and_mob/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  ProfileAvatar({required this.imageUrl, this.isActive = false, this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive ? Positioned(
          right: 0.0,
          bottom: 0.0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.online,
              border: Border.all(width: 2.0, color: Colors.white),
            ),
            height: 15.0,
            width: 15.0,
          ),
        ) : SizedBox.shrink(),
      ],
    );
  }
}
