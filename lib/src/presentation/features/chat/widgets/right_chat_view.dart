import 'package:dating/src/presentation/components/theme/app_theme.dart';
import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/chat/model/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightChatView extends StatelessWidget {
  final ChatModel chatModel;

  const RightChatView({required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerRight,
      widthFactor: 0.85,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppThemeData.CircularRadius),
                    topRight: Radius.circular(AppThemeData.CircularRadius),
                    bottomLeft: Radius.circular(AppThemeData.CircularRadius),
                  )),
              child: Text(
                chatModel.message,
                style: textStyleColored(FontWeight.normal, 13, Colors.black),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  chatModel.time,
                  style: textStyleColored(
                      FontWeight.normal, 13, Colors.black.withOpacity(0.5)),
                ),
                SizedBox(
                  width: 1,
                ),
                chatModel.seen && !chatModel.fromOther
                    ? Icon(
                        CupertinoIcons.checkmark_alt,
                        size: 17,
                        color: Theme.of(context).primaryColor,
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
