import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/hobbie/data/repositories/hobby_repository_impl.dart';
import 'package:dating/src/features/hobbie/presentation/widgets/hobby_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/remote_hobbies_bloc.dart';

class HobbyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //List<InterestModel> _list = InterestModel.items();
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
              //Expanded(child: InterestListWidget(list: _list)),
              Expanded(child:BlocProvider(
                create: (_) => RemoteHobbiesBloc(
                    repository: HobbyRepositoryImpl()),
                child: HobbyList(),
              ),
              ),
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
