import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/models/person_model.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterMobileView extends StatefulWidget {
  const EnterMobileView({Key? key}) : super(key: key);

  @override
  _EnterMobileViewState createState() => _EnterMobileViewState();
}

class _EnterMobileViewState extends State<EnterMobileView> {
  TextEditingController _mobileNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            child: Column(
              children: [
                _buildTopSection(context),
                _buildMobileTextField(_mobileNumController),
                _continueButton(_mobileNumController, context)
              ],
            ),
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
        AppText.myMobile,
        style: textStyleColored(FontWeight.bold, 25, Colors.black),
      );

  _buildSubTitle() => Text(
        AppText.myMobileInfo,
        style: textStyleColored(
            FontWeight.normal, 13, AppColor.blackShadeTextColor),
      );

  _buildMobileTextField(TextEditingController controller) => Container(
        margin: EdgeInsets.only(top: 30),
        child: TextField(
          controller: controller,
          style: textStyleColored(
              FontWeight.normal, 13, AppColor.blackShadeTextColor),
          keyboardType: TextInputType.numberWithOptions(signed: true),
          maxLength: 10,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              hintText: AppText.mobileHint,
              disabledBorder: InputBorder.none,
              focusedBorder: inputBorderOutline,
              enabledBorder: inputBorderOutline,
              isDense: true,
              border: inputBorderOutline),
        ),
      );

  _continueButton(TextEditingController controller, BuildContext context) =>
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () {
              print(controller.text);
              if(controller.text.length < 10)
                return;

              PersonModel personModel = new PersonModel();
              personModel.phoneNumber = controller.text;
              PersonRepository repo = new PersonRepositoryImpl();
              repo.savePerson(personModel);
              AppNavigator.navigateToScreen(context, AppRoutes.otp);
            },
            child: Text(
              AppText.continueText,
              style: textStyleColored(FontWeight.bold, 16, null),
            )),
      );
}
