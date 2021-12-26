import 'package:dating/src/core/utils/router.dart';
import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavigationHelper {
  static List<PersistentBottomNavBarItem> itemViews() => [
        _bottomNavigationBarItem(
            Icons.dashboard,
            RouteAndNavigatorSettings(
              onGenerateRoute: RouterApp.generateRoute,
            )),
        _bottomNavigationBarItem(
            FontAwesome5.heart,
            RouteAndNavigatorSettings(
              onGenerateRoute: RouterApp.generateRoute,
            )),
        _bottomNavigationBarItem(
            Icons.chat_bubble,
            RouteAndNavigatorSettings(
              onGenerateRoute: RouterApp.generateRoute,
            )),
        _bottomNavigationBarItem(
            FontAwesome5.user,
            RouteAndNavigatorSettings(
              onGenerateRoute: RouterApp.generateRoute,
            ))
      ];

  static PersistentBottomNavBarItem _bottomNavigationBarItem(
          IconData icon, RouteAndNavigatorSettings settings) =>
      PersistentBottomNavBarItem(
        icon: Icon(
          icon,
          size: 20,
        ),
        routeAndNavigatorSettings: settings,
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: AppColor.purpleShade,
      );
}
