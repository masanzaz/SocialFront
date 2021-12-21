import 'package:dating/src/presentation/components/resources/app_text.dart';
import 'package:dating/src/presentation/components/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/discover/discover_filter_view.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';
import 'package:dating/src/presentation/features/matches/widgets/matches_grid_view.dart';
import 'package:flutter/material.dart';

class MatchesView extends StatefulWidget {
  @override
  _MatchesViewState createState() => _MatchesViewState();
}

class _MatchesViewState extends State<MatchesView> {
  @override
  Widget build(BuildContext context) {
    List<DiscoverPersonalModel> _list = MatchesModel.items();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: _title(),
        actions: [_filterIcon()],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: MatchesGridView(
          list: _list,
        ),
      ),
    );
  }

  Widget _title() => Text(
        AppText.matches,
        style: textStyleColored(FontWeight.bold, 25, Colors.black),
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

  _filterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      builder: (ct) => DiscoverFilterView(),
    );
  }
}
