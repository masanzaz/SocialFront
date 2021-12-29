import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/disability/data/repositories/disability_repository_impl.dart';
import 'package:dating/src/features/disability/presentation/widgets/disability_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class DisabilityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Expanded(child:BlocProvider(
                create: (_) => RemoteDisabilitiesBloc(
                    repository: DisabilityRepositoryImpl()),
                child: DisabilityList(),
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
    AppText.yourDisability,
    style: textStyleColored(FontWeight.bold, 25, Colors.black),
  );

  _buildSubTitle() => Text(
    AppText.DisabilityInfo,
    style: textStyleColored(
        FontWeight.normal, 13, AppColor.blackShadeTextColor),
  );

  _confirmButton(BuildContext context) => Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 30),
    child: ElevatedButton(
        onPressed: () {
          AppNavigator.navigateToScreen(context, AppRoutes.hobby);
        },
        child: Text(
          AppText.continueText,
          style: textStyleColored(FontWeight.bold, 16, null),
        )),
  );
}
