import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  //Text Fields & Buttons & List Items
  static const double CircularRadius = 12.0;

  static lightDarkIconStatusBar() =>
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark));

  static ThemeData appThemeData() => ThemeData(
      primaryColor: AppColor.primaryColor,
      accentColor: AppColor.accentColor,
      backgroundColor: Colors.white,
      splashColor: AppColor.primaryColor.withOpacity(0.1),
      textSelectionTheme: _textSelectionThemeData(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      outlinedButtonTheme: _outlineThemeData(),
      textButtonTheme: _textButtonTheme(),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.primaryColor)),
      textTheme: GoogleFonts.workSansTextTheme(),
      sliderTheme: sliderThemeData(),
      scaffoldBackgroundColor: Colors.white);

  static TextSelectionThemeData _textSelectionThemeData() =>
      TextSelectionThemeData(
          cursorColor: AppColor.primaryColor,
          selectionColor: AppColor.primaryColor.withOpacity(0.2),
          selectionHandleColor: AppColor.primaryColor.withOpacity(0.2));

  static TextButtonThemeData _textButtonTheme() => TextButtonThemeData(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              AppColor.primaryColor.withOpacity(0.1))));

  static ElevatedButtonThemeData _elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
          style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(CircularRadius)))),
      ));

  static OutlinedButtonThemeData _outlineThemeData() => OutlinedButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColor.primaryColor),
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        overlayColor:
            MaterialStateProperty.all(AppColor.primaryColor.withOpacity(0.1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(CircularRadius)))),
      ));

  static SliderThemeData sliderThemeData() => SliderThemeData(
      thumbColor: AppColor.primaryColor,
      inactiveTrackColor: Colors.grey.withOpacity(0.1),
      activeTrackColor: AppColor.primaryColor);
}
