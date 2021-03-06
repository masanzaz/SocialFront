import 'package:dating/src/core/params/otp_parameter.dart';
import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/otp/data/repositories/otp_repository_impl.dart';
import 'package:dating/src/features/otp/domain/repositories/otp_repository.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  String token = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            child: Column(
              children: [
                _buildTimerText(),
                _buildOtpInfo(),
                _buildOtpView(),
                _buildSendAgain(),
                _confirmButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTimerText() {
    return Container(
      margin: EdgeInsets.only(
          top: ((MediaQuery.of(context).size.height * 0.1) - (kToolbarHeight))),
      child: Text(
        "00:42",
        style: textStyleColored(FontWeight.bold, 30, Colors.black),
      ),
    );
  }

  _buildOtpInfo() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        AppText.otpInfoText,
        textAlign: TextAlign.center,
        style: textStyleColored(
            FontWeight.normal, 17, AppColor.blackShadeTextColor),
      ),
    );
  }

  _buildOtpView() {
    Color color = Theme.of(context).primaryColor;
    return Container(
        margin: EdgeInsets.only(top: 35),
        child: PinCodeTextField(
          appContext: context,
          length: 4,
          onChanged: (pin) {},
          animationType: AnimationType.none,
          cursorColor: color,
          cursorHeight: 15,
          textStyle: textStyleColored(FontWeight.bold, 18, color),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          animationCurve: Curves.linear,
          onCompleted: (result) {
            token = result;
            print(result);
          },
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              fieldHeight: 60,
              fieldWidth: 60,
              borderRadius: BorderRadius.circular(12),
              activeColor: color,
              selectedColor: color,
              inactiveColor: Colors.black.withOpacity(0.1)),
        ));
  }

  _buildSendAgain() => Container(
        margin: EdgeInsets.only(top: 35),
        child: InkWell(
          onTap: () {},
          child: Text(
            AppText.sendAgain,
            style: textStylePrimary(context, FontWeight.bold, 15),
          ),
        ),
      );

  _confirmButton(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () async {
              PersonRepositoryImpl repo = new PersonRepositoryImpl();
              var localPerson = await repo.getPerson();
              OtpRepository otpRepository = new OtpRepositoryImpl();
              OtpParameter otpParameter = new OtpParameter(phoneNumber: localPerson.phoneNumber??'', token: token);
              var response = await otpRepository.ValidateTokenByPhone(otpParameter);
              if(response)
                {
                  try{
                    var person = await repo.getPersonByPhone(localPerson.phoneNumber??'');
                    repo.savePerson(person);
                    AppNavigator.navigateToScreen(context, AppRoutes.enableNotification);
                  } catch(_){
                    AppNavigator.navigateToScreen(context, AppRoutes.gender);
                  }
                }
            },
            child: Text(
              AppText.confirmText,
              style: textStyleColored(FontWeight.bold, 16, null),
            )),
      );
}
