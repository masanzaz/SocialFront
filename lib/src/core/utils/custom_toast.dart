import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class CustomToast {

  static Widget successMessage(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColor.primaryColor,
      ),
        child: Text(
          message,
          style: textStyleColored(
              FontWeight.bold, 16, Colors.white),
        ),
    );
    return toast;
  }

  static Widget errorMessage(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColor.primaryColor,
      ),
      child: Text(
        message,
        style: textStyleColored(
            FontWeight.bold, 16, Colors.white),
      ),
    );
    return toast;
  }



}