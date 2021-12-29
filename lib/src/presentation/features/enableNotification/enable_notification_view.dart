import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';
import 'package:flutter/material.dart';

class EnableNotificationView extends StatelessWidget {
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
          child: assetImage(R.IMAGES_NOTIFICATION_PNG),
        ),
      );

  _buildTitle() => Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          AppText.enableNotification,
          style: textStyleColored(FontWeight.bold, 25, Colors.black),
        ),
      );

  _buildSubTitle() => Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          AppText.enableNotificationInfo,
          textAlign: TextAlign.center,
          style: textStyleColored(FontWeight.normal, 14, Colors.black),
        ),
      );

  _confirmButton(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () async {

              PersonRepository repo = new PersonRepositoryImpl();
              var person = await  repo.getPerson();
              var result = repo.registerPerson(person);

              AppNavigator.navigateToScreen(context, AppRoutes.dashboard);
            },
            child: Text(
              AppText.iWantToNotified,
              style: textStyleColored(FontWeight.bold, 16, null),
            )),
      );
}
