import 'dart:math' as math;
import 'package:dating/src/core/params/chat_parameter.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/match/data/repositories/match_repository_impl.dart';
import 'package:dating/src/features/match/domain/repositories/match_repository.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/presentation/features/chat/chat_view.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';
import 'package:dating/src/presentation/features/message/model/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ItsMatchView extends StatefulWidget {
  @override
  _ItsMatchView createState() => _ItsMatchView();
}

class _ItsMatchView extends State<ItsMatchView> {
  late MatchesModel matchModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    matchModel = ModalRoute.of(context)?.settings.arguments as MatchesModel;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
          child: Column(
            children: [
              _buildImageWrapper(context, matchModel),
              _title(context, matchModel),
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

  Widget _buildImageWrapper(BuildContext context, MatchesModel match) => Container(
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
              child: _buildUpperImageStack(context, match),
            ),
            Positioned(
              left: 50,
              bottom: 0,
              child: _buildBottomImageStack(context, match),
            ),
          ],
        ),
      );

  Widget _buildUpperImageStack(BuildContext context, MatchesModel match) => Transform.rotate(
        angle: math.pi / 20,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.35,
                child: networkImage(match.image),
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

  Widget _buildBottomImageStack(BuildContext context, MatchesModel match) => Transform.rotate(
        angle: -math.pi / 20,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.35,
                child: networkImage(match.matchImage),
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
          heroTag: 1,
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

  Widget _title(BuildContext context, MatchesModel match) => Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
        child: Text(
          "${AppText.itsMatch}, " + match.name,
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
            MessageModel messageModel = new MessageModel(
                id: matchModel.id,
                userProfile : matchModel.image ,
                hasStory: false,
                name: matchModel.name,
                recentMessage : "",
                time: "",
                unreadCount : 0
            );

            AppNavigator.navigateToScreenWithoutNavBar(
                context, ChatView(match: messageModel), PageTransitionAnimation.cupertino);
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
