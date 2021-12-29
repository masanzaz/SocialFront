import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/gender/data/repositories/gender_repository_impl.dart';
import 'package:dating/src/features/gender/presentation/bloc/bloc.dart';
import 'package:dating/src/features/interested/presentation/widgets/interested_list_widget.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                _titleText(context),
                //GenderList(list: _list),
                Expanded(child:BlocProvider(
                  create: (_) => GenderBloc(
                      repository: GenderRepositoryImpl()),
                  child: InterestedList(),
                ),
                ),
                _confirmButton(context),
              ],
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
        AppText.interestedTitle,
        style: textStyleColored(FontWeight.bold, 30, Colors.black),
      ),
    );
  }

  _confirmButton(BuildContext context) => Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 30),
    child: ElevatedButton(
        onPressed: () async {
          PersonRepository repo = new PersonRepositoryImpl();
          var person = await  repo.getPerson();
          if(person.interestedId != 0)
            AppNavigator.navigateToScreen(context, AppRoutes.disability);
        },
        child: Text(
          AppText.continueText,
          style: textStyleColored(FontWeight.bold, 16, null),
        )),
  );
}
