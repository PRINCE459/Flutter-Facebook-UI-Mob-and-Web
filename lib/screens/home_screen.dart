import 'package:facebook_for_web_and_mob/config/palette.dart';
import 'package:facebook_for_web_and_mob/data/data.dart';
import 'package:facebook_for_web_and_mob/models/models.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {

  final TrackingScrollController _trackingScrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _MobileHomeScreen(scrollController: _trackingScrollController),
          desktop: _DesktopHomeScreen(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _MobileHomeScreen extends StatelessWidget {
  final TrackingScrollController scrollController;
  _MobileHomeScreen({required this.scrollController});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text("facebook", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, letterSpacing: -1.2, color: Palette.facebookBlue),),
          floating: true,
          actions: [
            CircleButton(icon: Icons.search, iconSize: 25.0, onPressed: () => print("Search Button Pressed"), ),
            CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 25.0, onPressed: () => print("Messenger Button Pressed"), ),
          ],
        ),
        // FaceBook Post Container
        SliverToBoxAdapter(
          child: Container(
            child: CreatePostContainer(currentUser: currentUser),
          ),
        ),
        // FaceBook Room Container
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              child: RoomBuilder(onlineUsers: onlineUsers),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Container(
              child: StoryBuilder(currentUser: currentUser, stories: stories, ),
            ),
          ),
        ),

        // FaceBook Posts
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            Post post = posts[index];
            return PostContainer(post: post,);
          },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}


class _DesktopHomeScreen extends StatelessWidget {
  final TrackingScrollController scrollController;
  _DesktopHomeScreen({required this.scrollController});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Align( alignment: Alignment.centerLeft, child: MoreOptionsList(currentUser: currentUser)),
        ),
        Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              // FaceBook Story Container
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    child: StoryBuilder(currentUser: currentUser, stories: stories, ),
                  ),
                ),
              ),

              // FaceBook Post Container
              SliverToBoxAdapter(
                child: Container(
                  child: CreatePostContainer(currentUser: currentUser),
                ),
              ),

              // FaceBook Room Container
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    child: RoomBuilder(onlineUsers: onlineUsers),
                  ),
                ),
              ),

              // FaceBook Posts
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  Post post = posts[index];
                  return PostContainer(post: post,);
                },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Expanded(
          flex: 2,
          child: Align( alignment: Alignment.centerRight, child: ContactsList(users: onlineUsers)),
        ),
      ],
    );
  }
}
