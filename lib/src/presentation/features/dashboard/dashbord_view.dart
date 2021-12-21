import 'package:dating/src/presentation/components/utils/utils.dart';
import 'package:dating/src/presentation/features/dashboard/helper/bottom_navigation_helper.dart';
import 'package:dating/src/presentation/features/discover/discover_view.dart';
import 'package:dating/src/presentation/features/matches/matches_view.dart';
import 'package:dating/src/presentation/features/message/message_view.dart';
import 'package:dating/src/presentation/features/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DashBoardView extends StatefulWidget {
  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    _controller.addListener(() {
      dismissKeyboard(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: BottomNavigationHelper.itemViews(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style3,
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [DiscoverView(), MatchesView(), MessageView(), ProfileView()];
  }
}
