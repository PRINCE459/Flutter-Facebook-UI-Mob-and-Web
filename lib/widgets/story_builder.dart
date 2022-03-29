import 'package:facebook_for_web_and_mob/config/palette.dart';
import 'package:facebook_for_web_and_mob/data/data.dart';
import 'package:facebook_for_web_and_mob/models/models.dart';
import 'package:facebook_for_web_and_mob/models/story_model.dart';
import 'package:facebook_for_web_and_mob/widgets/profile_avatar.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StoryBuilder extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  StoryBuilder({required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(
                  currentUser: currentUser,
                  isAddStory: true,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                story: story,
              ),
            );
          }
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final User? currentUser;
  final bool isAddStory;
  final Story? story;

  const _StoryCard({this.currentUser, this.isAddStory = false, this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(12.0),
           child: CachedNetworkImage(
             imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
             height: double.infinity,
             width: 110.0,
             fit: BoxFit.cover,
           ),
         ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.isDesktop(context) ? [BoxShadow( color: Colors.black26, offset: Offset(0,2), blurRadius: 4.0),] : null,
            gradient: Palette.storyGradient,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory ? Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(Icons.add, size: 25.0, color: Palette.facebookBlue,),
          ) : ProfileAvatar(imageUrl: story!.user.imageUrl, hasBorder: story!.isViewed, ),
        ),
        Positioned(
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
          child: Text(
            isAddStory ? currentUser!.name : story!.user.name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
            maxLines: 2, // Text Will Wrap Itself after 2 lines
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

