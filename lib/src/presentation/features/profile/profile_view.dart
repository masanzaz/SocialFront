import 'package:dating/src/core/utils/custom_toast.dart';
import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/models/update_person_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  FToast fToast = FToast();
  TextEditingController _nameCon = TextEditingController();
  TextEditingController _lastNameCon = TextEditingController();
  TextEditingController _aboutCon = TextEditingController();
  TextEditingController _birthDateCon = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  File? _image;
  File imageDefault = File(R.IMAGES_MAN_JPG);
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    _loadPerson();
  }

  _loadPerson() async {
    PersonRepositoryImpl repo = new PersonRepositoryImpl();
    var person = await repo.getPerson();
    repo.getPersonById(person.id??0).then((persons) {
      setState(() {
        _nameCon.text = persons.firstName??'';
        _lastNameCon.text = persons.lasName??'';
        _aboutCon.text = persons.about??'';
        _birthDateCon.text = persons.dateOfBirth?.toString()??'';
        _imageUrl = persons.image??R.IMAGES_MODEL2_JPG;
        _nameCon.text = persons.firstName??'';
      });
    });
  }


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
                _buildAbout(),
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
                child: _image != null? Image.file(
                  _image??imageDefault,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitHeight,
                ):
                networkImage(_imageUrl??R.IMAGES_MODEL2_JPG),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
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

  _buildAbout() => Container(
    margin: EdgeInsets.only(top: 15),
    child: TextField(
      controller: _aboutCon,
      keyboardType: TextInputType.multiline,
        maxLines:3,
      style: textStyleColored(
          FontWeight.normal, 14, AppColor.blackShadeTextColor),
      decoration: InputDecoration(
          hintText: AppText.aboutMe,
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

  _imgFromCamera() async {
    File image = (await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    ));

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = (await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ));

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _confirmButton(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            onPressed: () async {
              PersonRepositoryImpl repoPerson = new PersonRepositoryImpl();
              var person = await repoPerson.getPerson();
              UpdatePersonModel params = new UpdatePersonModel();
              if(_image != null)
                {
                  imageDefault = _image??imageDefault;
                  var imageBytes = imageDefault.readAsBytesSync();
                  params.image = base64Encode(imageBytes);
                }

              params.id = person.id;
              params.firstName = _nameCon.text;
              params.lasName = _lastNameCon.text;
              params.dateOfBirth = _birthDateCon.text;
              params.about = _aboutCon.text;
              var result = await repoPerson.updatePerson(params);
              var message = (result > 0)? AppText.okMessage:AppText.errorMessage;
              fToast.showToast(
                child: CustomToast.successMessage(message),
                toastDuration: Duration(seconds: 3),
              );
            },
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
