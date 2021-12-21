import 'package:dating/src/presentation/components/resources/app_color.dart';
import 'package:dating/src/presentation/components/resources/app_text.dart';
import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/domain/const/resource.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController _nameCon = TextEditingController();
  TextEditingController _lastNameCon = TextEditingController();
  TextEditingController _birthDateCon = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: _titleText(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 10, left: 25, right: 25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _profileSelection(),
                _buildFirstName(),
                _buildLastName(),
                _buildBirthDay(),
                _confirmButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _titleText() => Text(
        AppText.profileDetails,
        style: textStyleColored(FontWeight.bold, 25, Colors.black),
      );

  _profileSelection() => Container(
        height: 110,
        width: 110,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: networkImage(R.IMAGES_MODEL2_JPG),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      );

  _buildFirstName() => Container(
        margin: EdgeInsets.only(top: 30),
        child: TextField(
          controller: _nameCon,
          style: textStyleColored(
              FontWeight.normal, 14, AppColor.blackShadeTextColor),
          decoration: InputDecoration(
              hintText: AppText.firstName,
              disabledBorder: InputBorder.none,
              focusedBorder: inputBorderOutline,
              enabledBorder: inputBorderOutline,
              isDense: true,
              border: inputBorderOutline),
        ),
      );

  _buildLastName() => Container(
        margin: EdgeInsets.only(top: 15),
        child: TextField(
          controller: _lastNameCon,
          style: textStyleColored(
              FontWeight.normal, 14, AppColor.blackShadeTextColor),
          decoration: InputDecoration(
              hintText: AppText.lastName,
              disabledBorder: InputBorder.none,
              focusedBorder: inputBorderOutline,
              enabledBorder: inputBorderOutline,
              isDense: true,
              border: inputBorderOutline),
        ),
      );

  _buildBirthDay() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: _birthDateCon,
        style: textStyleColored(
            FontWeight.normal, 14, AppColor.blackShadeTextColor),
        maxLength: 10,
        validator: (s) {
          if (_birthDateValidator(s.toString()))
            return null;
          else
            return AppText.invalidBirthdateError;
        },
        onChanged: (s) {
          _formKey.currentState!.validate();
        },
        decoration: InputDecoration(
            hintText: AppText.birthDateHint,
            counterText: "",
            errorStyle: textStyleColored(FontWeight.normal, 14, Colors.red),
            disabledBorder: InputBorder.none,
            focusedBorder: inputBorderOutline,
            enabledBorder: inputBorderOutline,
            isDense: true,
            border: inputBorderOutline),
      ),
    );
  }

  _confirmButton(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              AppText.confirmText,
              style: textStyleColored(FontWeight.bold, 16, null),
            )),
      );

  bool _birthDateValidator(String date) =>
      RegExp(r'(?:0[1-9]|[12][0-9]|3[01])[\/](?:0[1-9]|1[012])[\/](?:19\d{2}|20[02][0-9]|2021)\b')
          .stringMatch(date) !=
      null;
}
