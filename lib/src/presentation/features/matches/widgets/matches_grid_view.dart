import 'dart:ui';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class MatchesGridView extends StatefulWidget {
  final List<MatchesModel> list;

  const MatchesGridView({required this.list});

  @override
  _MatchesGridViewState createState() => _MatchesGridViewState();
}

class _MatchesGridViewState extends State<MatchesGridView> {
  List<MatchesModel> get _list => widget.list;

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.6;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
      ),
      itemCount: _list.length,
      itemBuilder: (ctx, index) {
        return _itemView(_list[index]);
      },
    );
  }

  _itemView(MatchesModel model) => Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Hero(
                  tag: model.id,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        AppNavigator.navigateToScreen(
                            context, AppRoutes.personDetail, model);
                      },
                      child: networkImage(model.image),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: model.isFavourite,
                child: Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                      onTap: () {},
                      child: Icon(FontAwesome5.star,
                          size: 10, color: Colors.white)),
                ),
              ),
              Column(
                children: [
                  Expanded(child: _nameAge(model)),
                  _bottomButtons(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _nameAge(MatchesModel model) {
    return IgnorePointer(
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.5, 0.9, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white10, Colors.black45, Colors.black38])),
        padding: const EdgeInsets.only(left: 12.0, bottom: 10, right: 12),
        child: Row(
          children: [
            Flexible(
              child: Text(
                model.name + ", ",
                overflow: TextOverflow.ellipsis,
                style: textStyleColored(FontWeight.bold, 15, Colors.white),
              ),
            ),
            Text(
              model.age.toString(),
              style: textStyleColored(FontWeight.bold, 15, Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomButtons() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          padding: const EdgeInsets.all(12.0),
          child: Material(
            color: Colors.transparent,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () {},
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      )),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                    width: 1,
                  ),
                  InkWell(
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.heart_solid,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
