import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/utils/utils.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/message/model/activities_model.dart';
import 'package:dating/src/presentation/features/message/widgets/message_story_image_view.dart';
import 'package:dating/src/presentation/features/storyView/story_view.dart';
import 'package:flutter/material.dart';

class ActivitiesView extends StatefulWidget {
  final List<ActivitiesModel> list;

  const ActivitiesView(this.list);

  @override
  _ActivitiesViewState createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (ctx, index) {
        return _itemView(widget.list[index]);
      },
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _itemView(ActivitiesModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MessageStoryImageView(
            showStoryBorder: model.isSeen,
            heroId: model.id.toString(),
            onImageTap: () {
              dismissKeyboard(context);
              AppNavigator.navigateToScreenWithoutNavBar(
                  context, StoryView(activitiesModel: model));
            },
            userProfileUrl: model.image,
            horizontalMargin: 5,
          ),
          Spacer(),
          _name(model)
        ],
      );

  Container _name(ActivitiesModel model) {
    return Container(
      width: 70,
      alignment: Alignment.center,
      child: Text(
        model.name,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: textStyleColored(FontWeight.bold, 12, Colors.black),
      ),
    );
  }
}
