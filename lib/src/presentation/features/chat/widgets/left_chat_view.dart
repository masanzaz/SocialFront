import 'package:dating/src/core/theme/app_theme.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/chat/model/chat_model.dart';
import 'package:flutter/material.dart';

class LeftChatView extends StatelessWidget {
  final ChatModel chatModel;

  const LeftChatView({required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 0.85,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppThemeData.CircularRadius),
                    topRight: Radius.circular(AppThemeData.CircularRadius),
                    bottomRight: Radius.circular(AppThemeData.CircularRadius),
                  )),
              child: Text(
                chatModel.message,
                style: textStyleColored(FontWeight.normal, 13, Colors.black),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              chatModel.time,
              style: textStyleColored(
                  FontWeight.normal, 13, Colors.black.withOpacity(0.5)),
            )
          ],
        ),
      ),
    );
  }
}
