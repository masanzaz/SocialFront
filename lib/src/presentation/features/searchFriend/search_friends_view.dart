import 'package:dating/src/presentation/components/resources/app_routes.dart';
import 'package:dating/src/presentation/components/resources/app_text.dart';
import 'package:dating/src/presentation/components/utils/navigator.dart';
import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/domain/const/resource.dart';
import 'package:flutter/material.dart';

class SearchFriendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [toolbarSkipButton(context, () {})],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
          child: Column(
            children: [
              _buildImageWidget(context),
              _buildTitle(),
              _buildSubTitle(),
              Spacer(),
              _confirmButton(context)
            ],
          ),
        ),
      ),
    );
  }

  _buildImageWidget(BuildContext context) => Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(
              top: ((MediaQuery.of(context).size.height * 0.1) -
                  (kToolbarHeight))),
          width: 180,
          height: 180,
          child: assetImage(R.IMAGES_SEARCH_FRIENDS_PNG),
        ),
      );

  _buildTitle() => Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          AppText.searchFriends,
          style: textStyleColored(FontWeight.bold, 25, Colors.black),
        ),
      );

  _buildSubTitle() => Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          AppText.searchFriendsInfo,
          textAlign: TextAlign.center,
          style: textStyleColored(FontWeight.normal, 14, Colors.black),
        ),
      );

  _confirmButton(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () {
              AppNavigator.navigateToScreen(
                  context, AppRoutes.enableNotification);
            },
            child: Text(
              AppText.accessToContact,
              style: textStyleColored(FontWeight.bold, 16, null),
            )),
      );
}
