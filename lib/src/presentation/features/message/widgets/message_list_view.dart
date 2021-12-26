import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/utils/utils.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/chat/chat_view.dart';
import 'package:dating/src/presentation/features/message/model/messages_model.dart';
import 'package:dating/src/presentation/features/message/widgets/message_story_image_view.dart';
import 'package:dating/src/presentation/features/storyView/story_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MessageListView extends StatefulWidget {
  final List<MessageModel> list;

  const MessageListView(this.list);

  @override
  _MessageListViewState createState() => _MessageListViewState();
}

class _MessageListViewState extends State<MessageListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.list.length,
      itemBuilder: (ctx, index) {
        return _itemView(widget.list[index]);
      },
    );
  }

  Widget _itemView(MessageModel model) => ListTile(
      contentPadding: EdgeInsets.only(top: 5),
      leading: _image(model),
      title: _title(model),
      subtitle: _subTitle(model),
      onTap: () {
        _messageSheet();
      });

  Widget _image(MessageModel model) {
    return MessageStoryImageView(
      height: 60,
      width: 60,
      showStoryBorder: model.hasStory,
      heroId: model.id.toString(),
      onImageTap: () {
        dismissKeyboard(context);
        AppNavigator.navigateToScreenWithoutNavBar(
          context,
          StoryView(activitiesModel: model.activitiesModel!),
        );
      },
      userProfileUrl: model.userProfile,
    );
  }

  Row _title(MessageModel model) {
    return Row(
      children: [
        Expanded(
          child: _name(model),
        ),
        _time(model)
      ],
    );
  }

  Text _time(MessageModel model) {
    return Text(
      model.time,
      style:
          textStyleColored(FontWeight.bold, 13, Colors.black.withOpacity(0.3)),
    );
  }

  Text _name(MessageModel model) {
    return Text(
      model.name,
      overflow: TextOverflow.ellipsis,
      style: textStyleColored(FontWeight.bold, 14, Colors.black),
    );
  }

  Container _subTitle(MessageModel model) {
    return Container(
      margin: EdgeInsets.only(top: 3),
      child: Row(
        children: [
          Expanded(
            child: _recentMessage(model),
          ),
          model.unreadCount != "0" ? _counter(model) : SizedBox()
        ],
      ),
    );
  }

  Text _recentMessage(MessageModel model) {
    return Text(
      model.recentMessage,
      overflow: TextOverflow.ellipsis,
      style: textStyleColored(FontWeight.normal, 14, Colors.black),
    );
  }

  Container _counter(MessageModel model) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor, shape: BoxShape.circle),
      child: Text(model.unreadCount,
          style: textStyleColored(FontWeight.normal, 12, Colors.white)),
    );
  }

  _messageSheet() {
    AppNavigator.navigateToScreenWithoutNavBar(
        context, ChatView(), PageTransitionAnimation.cupertino);
  }
}
