import 'package:dating/src/core/utils/resources/resource.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/chat/model/chat_model.dart';
import 'package:dating/src/presentation/features/chat/widgets/chat_list_view.dart';
import 'package:dating/src/presentation/features/message/widgets/message_story_image_view.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<ChatModel> _list = ChatModel.items();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                child: ChatListView(
                  list: _list,
                ),
              ),
              _messageView()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 80,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MessageStoryImageView(
            width: 50,
            height: 50,
            heroId: 'randomString',
            showStoryBorder: false,
            userProfileUrl: R.IMAGES_MODEL1_JPG,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.vertical,
              clipBehavior: Clip.hardEdge,
              children: [
                Text(
                  "Emelie",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: textStyleColored(FontWeight.bold, 22, Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      "Online",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: textStyleColored(
                          FontWeight.normal, 12, Colors.black.withOpacity(0.5)),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 8,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: FractionallySizedBox(
            heightFactor: 0.5,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.0)),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(Icons.more_vert),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _messageView() => Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: AppText.yourMessage,
                    disabledBorder: InputBorder.none,
                    focusedBorder: inputBorderOutline,
                    enabledBorder: inputBorderOutline,
                    isDense: true,
                    border: inputBorderOutline),
                onTap: () {},
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(11.5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.mic,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      );
}
