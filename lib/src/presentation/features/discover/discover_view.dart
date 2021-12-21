import 'dart:async';

import 'package:dating/src/presentation/components/resources/app_routes.dart';
import 'package:dating/src/presentation/components/resources/app_text.dart';
import 'package:dating/src/presentation/components/utils/navigator.dart';
import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/discover/discover_filter_view.dart';
import 'package:dating/src/presentation/features/discover/helper/discover_dimension_helper.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'package:dating/src/presentation/features/discover/widgets/discover_person_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class DiscoverView extends StatefulWidget {
  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  final _pageController = PageController();

  DiscoverDimensionHelper get _discoverDimensionHelper =>
      DiscoverDimensionHelper(context: context);
  final StreamController<bool> _cardStackHideController =
      StreamController<bool>.broadcast();

  Sink get _cardStackHideSink => _cardStackHideController.sink;

  Stream<bool> get _cardStackHideStream => _cardStackHideController.stream;
  final List<DiscoverPersonalModel> _list = DiscoverPersonalModel.items();

  @override
  void dispose() {
    _cardStackHideController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: _title(),
        actions: [_filterIcon()],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              _stackedCard(true),
              _stackedCard(false),
              _pageView(),
            ],
          ),
          _bottomRow()
        ],
      ),
    );
  }

  Widget _title() => Column(
        children: [
          Text(
            AppText.discover,
            style: textStyleColored(FontWeight.bold, 25, Colors.black),
          ),
          Text(
            "London",
            style: textStyleColored(FontWeight.normal, 12.5, Colors.black),
          )
        ],
      );

  Widget _filterIcon() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            _filterBottomSheet();
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.0)),
                borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.filter_list_rounded),
          ),
        ),
      ),
    );
  }

  Widget _pageView() => ClipRRect(
        borderRadius: DiscoverPersonItemView.borderRadius(),
        child: Container(
          width: _discoverDimensionHelper.pageViewWidth,
          height: _discoverDimensionHelper.pageViewHeight,
          child: PageView.builder(
            itemCount: _list.length,
            scrollDirection: Axis.vertical,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              return DiscoverPersonItemView(
                model: _list[index],
              );
            },
            onPageChanged: (int index) {
              _cardStackHideSink.add(index != _list.length - 1);
            },
          ),
        ),
      );

  Widget _stackedCard(bool isFirst) => StreamBuilder<bool>(
      stream: _cardStackHideStream,
      initialData: _list.isNotEmpty,
      builder: (context, snapshot) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: snapshot.data == true ? 1 : 0,
          child: ClipRRect(
            borderRadius: DiscoverPersonItemView.borderRadius(),
            child: Container(
              width: isFirst
                  ? _discoverDimensionHelper.firstCardOfStackWidth
                  : _discoverDimensionHelper.secondCardOfStackWidth,
              height: isFirst
                  ? _discoverDimensionHelper.firstCardOfStackHeight
                  : _discoverDimensionHelper.secondCardOfStackHeight,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 10,
                  color: Theme.of(context)
                      .primaryColor
                      .withOpacity(isFirst ? 0.3 : 0.2),
                ),
              ),
            ),
          ),
        );
      });

  Widget _bottomRow() => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _rejectPersonButton(),
            SizedBox(
              width: 25,
            ),
            _heartPersonButton(),
            SizedBox(
              width: 25,
            ),
            _favPersonButton()
          ],
        ),
      );

  FloatingActionButton _rejectPersonButton() {
    return FloatingActionButton(
      elevation: 2,
      heroTag: "float1",
      onPressed: () {},
      child: Icon(Icons.close_rounded, color: Theme.of(context).primaryColor),
      backgroundColor: Colors.white,
    );
  }

  Container _heartPersonButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.2,
      child: FloatingActionButton(
        heroTag: "float2",
        elevation: 2,
        child: Icon(
          FontAwesome5.heart,
          size: MediaQuery.of(context).size.width * 0.08,
        ),
        onPressed: () {
          AppNavigator.navigateToScreen(context, AppRoutes.itsMatch);
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  FloatingActionButton _favPersonButton() => FloatingActionButton(
      heroTag: "float3",
      child: Icon(FontAwesome5.star, color: Theme.of(context).accentColor),
      elevation: 2,
      onPressed: () {},
      backgroundColor: Colors.white);

  _filterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      backgroundColor: Colors.white,
      builder: (ct) => DiscoverFilterView(),
    );
  }
}
