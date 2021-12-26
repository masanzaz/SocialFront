import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/intro/widgets/intro_pager_widget.dart';
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildIntroPager(context),
                _buildSignUpButton(context),
                _buildSignInSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildIntroPager(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: IntroPagerWidget(),
      );

  Container _buildSignUpButton(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 25, left: 25, right: 25),
        width: double.infinity * 0.1,
        child: ElevatedButton(
            onPressed: () {
              AppNavigator.navigateToScreen(context, AppRoutes.signIn);
            },
            child: Text(AppText.signUpButtonText)),
      );

  _buildSignInSection(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 20),
        child: InkWell(
          onTap: () {
            AppNavigator.navigateToScreen(context, AppRoutes.signIn);
          },
          child: Ink(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: AppText.signInText + " ",
                    style: textStyleAccent(context, FontWeight.normal, 13)),
                TextSpan(
                    text: AppText.signIn,
                    style: textStylePrimary(context, FontWeight.bold, 13))
              ]),
            ),
          ),
        ),
      );
}
