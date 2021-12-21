import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppNavigator {
  static navigateToScreen(BuildContext context, String routeName,
      [Object? args]) {
    Navigator.pushNamed(context, routeName, arguments: args);
  }

  static navigateToScreenWithoutNavBar(BuildContext context, Widget screen,
      [PageTransitionAnimation pageTransitionAnimation =
          PageTransitionAnimation.fade]) {
    pushNewScreen(
      context,
      screen: screen,
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: pageTransitionAnimation,
    );
  }
}
