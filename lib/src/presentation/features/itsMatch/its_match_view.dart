import 'dart:math' as math;
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/chat/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ItsMatchView extends StatelessWidget {
  const ItsMatchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
          child: Column(
            children: [
              _buildImageWrapper(context),
              _title(context),
              _subTitle(context),
              Spacer(),
              _buildSayHelloButton(context),
              _buildKeepSwipingButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWrapper(BuildContext context) => Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 50,
              top: 10,
              child: _buildUpperImageStack(context),
            ),
            Positioned(
              left: 50,
              bottom: 0,
              child: _buildBottomImageStack(context),
            ),
          ],
        ),
      );

  Widget _buildUpperImageStack(BuildContext context) => Transform.rotate(
        angle: math.pi / 20,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.35,
                child: networkImage(R.IMAGES_MODEL_MALE_JPG),
              ),
            ),
            Positioned(
              left: -15,
              top: -15,
              child: _buildHeart(context),
            )
          ],
        ),
      );

  Widget _buildBottomImageStack(BuildContext context) => Transform.rotate(
        angle: -math.pi / 20,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.35,
                child: networkImage(R.IMAGES_MODEL1_JPG),
              ),
            ),
            Positioned(
              left: -15,
              bottom: -15,
              child: _buildHeart(context),
            )
          ],
        ),
      );

  Widget _buildHeart(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.12,
        height: MediaQuery.of(context).size.width * 0.12,
        child: FloatingActionButton(
          heroTag: key,
          elevation: 2,
          child: Icon(
            FontAwesome5.heart,
            size: MediaQuery.of(context).size.width * 0.06,
            color: Theme.of(context).primaryColor,
          ),
          backgroundColor: Colors.white,
          onPressed: null,
        ),
      );

  Widget _title(BuildContext context) => Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
        child: Text(
          "${AppText.itsMatch}, Jake!",
          style: textStylePrimary(context, FontWeight.bold, 30),
        ),
      );

  Widget _subTitle(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 2),
        child: Text(
          AppText.itsMatchSubTitle,
          style: textStyleAccent(context, FontWeight.normal, 13),
        ),
      );

  _buildSayHelloButton(BuildContext context) => Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            int matchId =
            ModalRoute.of(context)?.settings.arguments as int;
            AppNavigator.navigateToScreenWithoutNavBar(
                context, ChatView(matchId: matchId), PageTransitionAnimation.cupertino);
          },
          child: Text(
            AppText.sayHello,
            style: textStyleColored(FontWeight.bold, 16, null),
          )));

  _buildKeepSwipingButton(BuildContext context) => Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            AppNavigator.navigateToScreen(context, AppRoutes.discover);
          },
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.pink.shade50)),
          child: Text(
            AppText.keepSwiping,
            style: textStyleColored(
                FontWeight.bold, 16, Theme.of(context).primaryColor),
          )));
}
