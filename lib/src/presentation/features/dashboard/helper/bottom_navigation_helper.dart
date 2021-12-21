import 'package:dating/src/presentation/components/resources/app_color.dart';
import 'package:dating/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavigationHelper {
  static List<PersistentBottomNavBarItem> itemViews() => [
        _bottomNavigationBarItem(
            Icons.dashboard,
            RouteAndNavigatorSettings(
              onGenerateRoute: MyApp.routes,
            )),
        _bottomNavigationBarItem(
            FontAwesome5.heart,
            RouteAndNavigatorSettings(
              onGenerateRoute: MyApp.routes,
            )),
        _bottomNavigationBarItem(
            Icons.chat_bubble,
            RouteAndNavigatorSettings(
              onGenerateRoute: MyApp.routes,
            )),
        _bottomNavigationBarItem(
            FontAwesome5.user,
            RouteAndNavigatorSettings(
              onGenerateRoute: MyApp.routes,
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
