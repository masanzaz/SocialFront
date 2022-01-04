import 'package:dating/src/core/utils/custom_toast.dart';
import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/signIn/widgets/sign_in_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInView extends StatelessWidget {
  FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            child: Column(
              children: [
                _buildIcon(context),
                _buildEmailButton(),
                _buildPhoneButton(context),
                _buildDividerLabel(),
                _buildSocialSection(context),
                _buildPrivacySection(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildIcon(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            child: assetImage(R.IMAGES_LOGO_PNG),
          ),
        ),
      );

  _buildEmailButton() => Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            fToast.showToast(
              child: CustomToast.errorMessage("Error..."),
              toastDuration: Duration(seconds: 3),
            );
          },
          child: Text(
            AppText.continueWithEmail,
            style: textStyleColored(FontWeight.bold, 16, null),
          )));

  _buildPhoneButton(BuildContext context) => Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      child: OutlinedButton(
          onPressed: () {
            AppNavigator.navigateToScreen(context, AppRoutes.enterMobile);
          },
          child: Text(
            AppText.usePhone,
            style: textStyleColored(
                FontWeight.bold, 16, Theme.of(context).primaryColor),
          )));

  _buildDividerLabel() => Container(
        margin: EdgeInsets.only(top: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(0.5),
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                AppText.orContinueWith,
                style: textStyleColored(FontWeight.normal, 14, null),
              ),
            ),
            Flexible(
              child: Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(0.5),
                height: 0.3,
              ),
            )
          ],
        ),
      );

  _buildSocialSection(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            socialItem(context, FontAwesome.facebook_official, () {}),
            socialItem(context, FontAwesome.google, () {}),
            socialItem(context, FontAwesome.apple, () {}),
          ],
        ),
      );

  _buildPrivacySection(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                AppText.termOfUse,
                style: textStylePrimary(context, FontWeight.w500, 15),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                AppText.privacyPolicy,
                style: textStylePrimary(context, FontWeight.w500, 15),
              ),
            )
          ],
        ),
      );
}
