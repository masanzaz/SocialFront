import 'package:dating/src/presentation/components/resources/app_routes.dart';
import 'package:dating/src/presentation/components/resources/app_text.dart';
import 'package:dating/src/presentation/components/utils/navigator.dart';
import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/gender/model/gender_model.dart';
import 'package:dating/src/presentation/features/gender/widgets/gender_list_widget.dart';
import 'package:flutter/material.dart';

class GenderSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<GenderModel> _list = GenderModel.items();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _titleText(context),
                GenderListWidget(list: _list),
                _confirmButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _titleText(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
          top: ((MediaQuery.of(context).size.height * 0.1) - (kToolbarHeight)),
          bottom: 50),
      child: Text(
        AppText.genderTitle,
        style: textStyleColored(FontWeight.bold, 30, Colors.black),
      ),
    );
  }

  _confirmButton(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () {
              AppNavigator.navigateToScreen(context, AppRoutes.interest);
            },
            child: Text(
              AppText.continueText,
              style: textStyleColored(FontWeight.bold, 16, null),
            )),
      );
}
