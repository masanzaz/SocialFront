import 'package:dating/src/presentation/components/resources/app_color.dart';
import 'package:dating/src/presentation/components/resources/app_routes.dart';
import 'package:dating/src/presentation/components/resources/app_text.dart';
import 'package:dating/src/presentation/components/utils/navigator.dart';
import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/interest/model/interest_model.dart';
import 'package:dating/src/presentation/features/interest/widgets/interest_list_widget.dart';
import 'package:dating/src/domain/models/hobbies/hobbyViewModel.dart';
import 'package:flutter/material.dart';

class InterestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<InterestModel> _list = InterestModel.items();
    List<HobbyViewModel> _list2 = InterestModel.items2();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
          child: Column(
            children: [
              _buildTopSection(context),
              SizedBox(
                height: 35,
              ),
              Expanded(child: InterestListWidget(list: _list)),
              _confirmButton(context)
            ],
          ),
        ),
      ),
    );
  }

  _buildTopSection(BuildContext context) => Container(
        margin: EdgeInsets.only(
            top: ((MediaQuery.of(context).size.height * 0.1) -
                (kToolbarHeight))),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            runSpacing: 5,
            children: [_buildTitle(), _buildSubTitle()],
          ),
        ),
      );

  _buildTitle() => Text(
        AppText.yourInterest,
        style: textStyleColored(FontWeight.bold, 25, Colors.black),
      );

  _buildSubTitle() => Text(
        AppText.interestInfo,
        style: textStyleColored(
            FontWeight.normal, 13, AppColor.blackShadeTextColor),
      );

  _confirmButton(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () {
              AppNavigator.navigateToScreen(context, AppRoutes.searchFriends);
            },
            child: Text(
              AppText.continueText,
              style: textStyleColored(FontWeight.bold, 16, null),
            )),
      );
}
