import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'package:dating/src/presentation/features/personDetail/widgets/sliver_app_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class PersonDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DiscoverPersonalModel _model =
        ModalRoute.of(context)?.settings.arguments as DiscoverPersonalModel;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(_model),
          SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                  child: _namePassionHeader(_model, context))),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Wrap(
                  runSpacing: 20,
                  children: [
                    _locationSection(_model, context),
                    _actionButtons(context),
                    _buildAbout(_model),
                    _photoGrid(_model, context)
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(DiscoverPersonalModel _model) {
    return SliverAppBar(
      expandedHeight: 250.0,
      elevation: 0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Hero(
        tag: _model.id,
        child: networkImage(_model.image),
      )),
    );
  }

  Widget _namePassionHeader(
      DiscoverPersonalModel _model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        dense: false,
        title: Text(
          _model.name + ", " + _model.age.toString(),
          maxLines: 1,
          style: textStyleColored(FontWeight.bold, 20, Colors.black),
        ),
        subtitle: Text(
          _model.passion,
          style: textStyleColored(
              FontWeight.normal, 13, AppColor.blackShadeTextColor),
        ),
        trailing: SizedBox(
          width: 45,
          height: 45,
          child: OutlinedButton(
            onPressed: () {},
            child: Icon(
              FontAwesome5.location_arrow,
              color: Theme.of(context).primaryColor,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _locationSection(DiscoverPersonalModel _model, BuildContext context) =>
      ListTile(
        contentPadding: EdgeInsets.all(0),
        dense: false,
        title: Text(
          AppText.location,
          style: textStyleColored(FontWeight.bold, 15, Colors.black),
        ),
        subtitle: Text(
          _model.location,
          style: textStyleColored(
              FontWeight.normal, 13, AppColor.blackShadeTextColor),
        ),
        trailing: Container(
          width: 42,
          height: 25,
          padding: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Theme.of(context).primaryColor,
                size: 10,
              ),
              SizedBox(width: 2),
              Text(
                "${_model.distance} km",
                style: textStylePrimary(context, FontWeight.bold, 10),
              )
            ],
          ),
        ),
      );

  Widget _actionButtons(BuildContext context) => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Ink(
                    color: Colors.white,
                    child: Icon(Icons.close, color: Colors.white)),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Icon(
                  FontAwesome5.heart,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Icon(FontAwesome5.star, color: Colors.white),
              ),
            )
          ],
        ),
      );

  Widget _buildAbout(DiscoverPersonalModel _model) => ListTile(
        contentPadding: EdgeInsets.all(0),
        dense: false,
        isThreeLine: true,
        title: Text(
          AppText.about,
          style: textStyleColored(FontWeight.bold, 15, Colors.black),
        ),
        subtitle: Text(
          _model.about,
          style: textStyleColored(
              FontWeight.normal, 13, AppColor.blackShadeTextColor),
        ),
      );

  Widget _photoGrid(DiscoverPersonalModel _model, BuildContext context) {
    List<String> _images = List.generate(9, (index) => _model.image);
    return Wrap(
      runSpacing: 12,
      children: [
        Text(
          AppText.gallery,
          style: textStyleColored(FontWeight.bold, 15, Colors.black),
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: _images.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            var item = _images[index];
            return InkWell(
              onTap: () {
                AppNavigator.navigateToScreen(
                    context, AppRoutes.imagePreview, item);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: networkImage(item),
              ),
            );
          },
        )
      ],
    );
  }
}
