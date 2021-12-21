import 'package:flutter/material.dart';

socialItem(BuildContext context, IconData iconData, Function onTap) => InkWell(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      onTap: () {
        onTap.call();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Icon(
          iconData,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
