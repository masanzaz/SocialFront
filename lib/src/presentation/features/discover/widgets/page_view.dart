import 'dart:async';

import 'package:dating/src/features/person/presentation/bloc/bloc.dart';
import 'package:dating/src/presentation/features/discover/helper/discover_dimension_helper.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'discover_person_item_view.dart';

class PageDiscoverView extends StatefulWidget {

  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageDiscoverView> {
  @override
  void initState() {
    super.initState();
    _loadPersons();
  }
  final _pageController = PageController();

  DiscoverDimensionHelper get _discoverDimensionHelper =>
      DiscoverDimensionHelper(context: context);
  final StreamController<bool> _cardStackHideController =
  StreamController<bool>.broadcast();

  Sink get _cardStackHideSink => _cardStackHideController.sink;

  Stream<bool> get _cardStackHideStream => _cardStackHideController.stream;

  _loadPersons() async {
    context.read<PersonsBloc>().add(ServiceLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonsBloc, PersonsState>(
        builder: (context, PersonsState state) {
          switch (state.status) {
            case PersonsStatus.failure:
              return const Center(child: Text('failed to fetch posts1'));
            case PersonsStatus.success:
              return _listView(state.persons);
            default:
              return const Center(child: Text('Loading...'));
          }
        }
    );
  }
  Widget _listView(List<DiscoverPersonalModel> list) {
    return
      Stack(
        alignment: Alignment.topCenter,
        children: [
          _stackedCard(true, list),
          _stackedCard(false, list),
          _pageView(list),
        ],
      );
  }

  Widget _pageView(List<DiscoverPersonalModel> list) => ClipRRect(
    borderRadius: DiscoverPersonItemView.borderRadius(),
    child: Container(
      width: _discoverDimensionHelper.pageViewWidth,
      height: _discoverDimensionHelper.pageViewHeight,
      child: PageView.builder(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return DiscoverPersonItemView(
            model: list[index],
          );
        },
        onPageChanged: (int index) {
          _cardStackHideSink.add(index != list.length - 1);
        },
      ),
    ),
  );

  Widget _stackedCard(bool isFirst, List<DiscoverPersonalModel> list) => StreamBuilder<bool>(
      stream: _cardStackHideStream,
      initialData: list.isNotEmpty,
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
}