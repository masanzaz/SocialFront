import 'package:flutter/material.dart';

class MessageStoryImageView extends StatelessWidget {
  final bool showStoryBorder;
  final String heroId;
  final Function? onImageTap;
  final String userProfileUrl;
  final double width;
  final double height;
  final double horizontalMargin;

  const MessageStoryImageView(
      {required this.showStoryBorder,
      required this.heroId,
      this.onImageTap,
      required this.userProfileUrl,
      this.width = 70,
      this.height = 70,
      this.horizontalMargin = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: !showStoryBorder
              ? null
              : Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Hero(
        tag: heroId,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: onImageTap == null
                ? null
                : () {
                    onImageTap?.call();
                  },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              backgroundImage: NetworkImage(
                userProfileUrl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
