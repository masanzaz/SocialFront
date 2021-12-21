import 'dart:ui';

import 'package:dating/src/presentation/components/resources/app_routes.dart';
import 'package:dating/src/presentation/components/utils/navigator.dart';
import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DiscoverPersonItemView extends StatelessWidget {
  final DiscoverPersonalModel model;

  const DiscoverPersonItemView({required this.model});

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.6;
    return ClipRRect(
      borderRadius: borderRadius(),
      child: Stack(
        children: [
          _itemImageFull(context),
          _itemNameAge(),
          _itemLocation(),
        ],
      ),
    );
  }

  Widget _itemImageFull(BuildContext context) => Container(
        width: double.infinity,
        height: double.infinity,
        child: Hero(
          tag: model.id,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: networkImage(model.image),
              onTap: () {
                AppNavigator.navigateToScreen(
                    context, AppRoutes.personDetail, model);
              },
            ),
          ),
        ),
      );

  Widget _itemLocation() => Positioned(
      top: 10,
      left: 10,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.white,
              size: 12,
            ),
            SizedBox(width: 2),
            Text(
              "${model.distance} km",
              style: textStyleColored(FontWeight.normal, 12, Colors.white),
            )
          ],
        ),
      ));

  Widget _itemNameAge() => Positioned.fill(
        child: IgnorePointer(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.5, 0.95],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white10, Colors.black38])),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      model.name + ", ",
                      overflow: TextOverflow.ellipsis,
                      style:
                          textStyleColored(FontWeight.bold, 22, Colors.white),
                    ),
                  ),
                  Text(
                    model.age.toString(),
                    style: textStyleColored(FontWeight.bold, 22, Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  static BorderRadius borderRadius() => BorderRadius.all(Radius.circular(18));
}
