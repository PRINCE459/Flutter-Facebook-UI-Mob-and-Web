// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_for_web_and_mob/config/palette.dart';
import 'package:facebook_for_web_and_mob/models/models.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  PostContainer({required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isDesktop ? 10.0 : 5.0),
      child: Container(
        margin: EdgeInsets.symmetric( horizontal: isDesktop ? 5.0 : 0.0 ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDesktop ? BorderRadius.circular(5.0) : BorderRadius.circular(0.0),
          boxShadow: isDesktop ? [BoxShadow( color: Colors.black12, offset: Offset(0,2), blurRadius: 4.0 )] : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: _PostHeader(post: post),
            ),
            // Post Caption
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(post.caption),
            ),
            SizedBox(height: 5.0,),
            // Post Image
            post.imageUrl.isEmpty != true ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: CachedNetworkImage(imageUrl: post.imageUrl,),
            ) : SizedBox(height: 5.0,),
            // Post Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: _PostButton(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Post post;
  _PostButton({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => print("Like Button Pressed"),
          child: Row(
            children: [
              Icon(Icons.thumb_up, size: 18.0, color: Colors.grey,),
              SizedBox(width: 3.0,),
              Text("Like", style: TextStyle(fontSize: 14.0, color: Colors.grey),),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => print("Comment Button Pressed"),
          child: Row(
            children: [
              Icon(Icons.messenger_outline, size: 18.0, color: Colors.grey,),
              SizedBox(width: 3.0,),
              Text("Comment", style: TextStyle(fontSize: 14.0, color: Colors.grey),),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => print("Share Button Pressed"),
          child: Row(
            children: [
              Icon(MdiIcons.share, size: 20.0, color: Colors.grey,),
              SizedBox(width: 3.0,),
              Text("Share", style: TextStyle(fontSize: 14.0, color: Colors.grey),),
            ],
          ),
        ),
      ],
    );
  }
}


class _PostStats extends StatelessWidget {
  final Post post;
  _PostStats({required this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container( height: 20.0, width: 20.0, decoration: BoxDecoration( shape: BoxShape.circle, color: Palette.facebookBlue ), child: Icon(Icons.thumb_up, size: 12.0, color: Colors.white, )),
                SizedBox(width: 5.0,),
                Text(post.likes.toString(), style: TextStyle(color: Colors.grey[600], fontSize: 13.0),),
              ],
            ),
            Row(
              children: [
                Text(post.comments.toString(), style: TextStyle(color: Colors.grey[600], fontSize: 13.0),),
                SizedBox(width: 5.0,),
                Text("Comments", style: TextStyle(color: Colors.grey[600], fontSize: 13.0), ),
              ],
            ),
            Row(
              children: [
                Text(post.shares.toString(), style: TextStyle(color: Colors.grey[600], fontSize: 13.0),),
                SizedBox(width: 5.0,),
                Text("Shares", style: TextStyle(color: Colors.grey[600], fontSize: 14.0 ),),
              ],
            ),
          ],
        ),
        Divider(
          height: 10.0,
          thickness: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }
}


class _PostHeader extends StatelessWidget {
  final Post post;
  _PostHeader({required this.post});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfileAvatar(imageUrl: post.user.imageUrl),
            SizedBox(width: 8.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.user.name, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),),
                Row(
                  children: [
                    Text(post.timeAgo, style: TextStyle(fontSize: 13.0, color: Colors.grey),),
                    SizedBox(width: 5.0,),
                    Container( height: 5.0, width: 5.0, decoration: BoxDecoration( color: Colors.grey, shape: BoxShape.circle ), ),
                    SizedBox(width: 5.0,),
                    Icon(Icons.public, size: 12.0, color: Colors.grey[600], ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () => print("More Button Pressed"),
            ),
          ],
        ),
      ],
    );
  }
}
