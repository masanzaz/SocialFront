import 'dart:async';
import 'package:dating/src/core/params/chat_parameter.dart';
import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/core/params/new_match_parameter.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/match/data/repositories/match_repository_impl.dart';
import 'package:dating/src/features/match/domain/repositories/match_repository.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
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
  var _list = <DiscoverPersonalModel>[];
  late DiscoverPersonalModel selecction;

  @override
  void initState() {
    super.initState();
    _loadPersons();
  }

  _loadPersons() async {
    PersonRepositoryImpl repo = new PersonRepositoryImpl();
    var person = await repo.getPerson();
    DiscoverParameter params = new DiscoverParameter(personId: person.id??0);
    repo.discoverPersons(params).then((persons) {
      setState(() {
        _list = persons;
      });
    });
  }

  final _pageController = PageController();

  DiscoverDimensionHelper get _discoverDimensionHelper =>
      DiscoverDimensionHelper(context: context);
  final StreamController<bool> _cardStackHideController =
  StreamController<bool>.broadcast();

  Sink get _cardStackHideSink => _cardStackHideController.sink;
  Stream<bool> get _cardStackHideStream => _cardStackHideController.stream;

  @override
  Future<void> dispose() async {
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
         /*Expanded(child:BlocProvider(
            create: (_) => PersonsBloc(
                repository: PersonRepositoryImpl()),
            child: PageDiscoverView(),
          )
          ),*/
          Stack(
            alignment: Alignment.topCenter,
            children: [
              _stackedCard(true, _list),
              _stackedCard(false, _list),
              _pageView(_list),
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
          selecction = list[index];
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
        onPressed: () async {
          PersonRepositoryImpl repo = new PersonRepositoryImpl();
          var person = await repo.getPerson();
          NewMatchParameter param = new NewMatchParameter(senderId: person.id??0, receiverId: selecction.id);
          var  isMatch = await repo.sendMatch(param);

          if(isMatch > 0) {
            MatchRepository repoMatch = new MatchRepositoryImpl();
            ChatParameter params = new ChatParameter(personId: person.id??0, matchId:isMatch);
            var match = await repoMatch.getMatchBydId(params);

            AppNavigator.navigateToScreen(context, AppRoutes.itsMatch, match);
          }
          else
            {
              AppNavigator.navigateToScreen(context, AppRoutes.discover);
            }
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
