import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/src/presentation/components/resources/app_color.dart';
import 'package:dating/src/presentation/components/resources/app_text.dart';
import 'package:dating/src/presentation/components/theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget assetImage(String asset) => Image.asset(
      asset,
      isAntiAlias: true,
      fit: BoxFit.cover,
    );

Widget networkImage(String url) => CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            color: AppColor.primaryColor,
            value: downloadProgress.progress,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: AppColor.primaryColor,
      ),
    );

TextStyle textStylePrimary(
        BuildContext context, FontWeight fontWeight, double fontSize) =>
    TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
        color: Theme.of(context).primaryColor);

TextStyle textStyleColored(
        FontWeight fontWeight, double fontSize, Color? color) =>
    TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
        color: color != null ? color : Colors.white);

TextStyle textStyleAccent(
        BuildContext context, FontWeight fontWeight, double fontSize) =>
    TextStyle(
        fontSize: fontSize,
        decoration: TextDecoration.none,
        fontWeight: fontWeight,
        color: Theme.of(context).accentColor.withBlue(90));

OutlineInputBorder inputBorderOutline = OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(AppThemeData.CircularRadius)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1)));

OutlineInputBorder inputBorderOutlineWhite = OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(AppThemeData.CircularRadius)),
    borderSide: BorderSide(color: Colors.white));

TextButton toolbarSkipButton(BuildContext context, Function onPress) =>
    TextButton(
        onPressed: () {
          onPress.call();
        },
        child: Text(
          AppText.skip,
          textAlign: TextAlign.center,
          style: textStylePrimary(context, FontWeight.w700, 16),
        ));
