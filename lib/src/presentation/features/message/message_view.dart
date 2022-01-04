import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/match/data/repositories/match_repository_impl.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';
import 'package:dating/src/presentation/features/message/model/messages_model.dart';
import 'package:dating/src/presentation/features/message/widgets/activities_view.dart';
import 'package:dating/src/presentation/features/message/widgets/message_list_view.dart';
import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  var _list = <MatchesModel>[];
  var _listMessage = <MessageModel>[];
  @override
  void initState() {
    super.initState();
    _loadMatches();
  }

  _loadMatches() async {
    PersonRepositoryImpl repo = new PersonRepositoryImpl();
    var person = await repo.getPerson();
    MatchRepositoryImpl repoMatch = new MatchRepositoryImpl();
    DiscoverParameter params = new DiscoverParameter(personId: person.id??0);
    repoMatch.getMatches(params).then((matches) {
      setState(() {
        _list = matches;
      });
    });

    repoMatch.getLasMessages(params).then((matches) {
      setState(() {
        _listMessage = matches;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: _titleText(),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            _searchField(),
            _activities(),
            Expanded(child: _messages())
          ],
        ),
      ),
    );
  }

  _titleText() => Text(
        AppText.messages,
        style: textStyleColored(FontWeight.bold, 25, Colors.black),
      );

  Widget _searchField() => Container(
        child: TextField(
          autofocus: false,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              hintText: AppText.search,
              focusColor: Colors.red,
              disabledBorder: InputBorder.none,
              focusedBorder: inputBorderOutline,
              enabledBorder: inputBorderOutline,
              isDense: true,
              border: inputBorderOutline),
        ),
      );

  Widget _activities() => Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.activities,
              style: textStyleColored(FontWeight.bold, 20, Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(height: 90, child: ActivitiesView(_list))
          ],
        ),
      );

  Widget _messages() => Container(
        margin: EdgeInsets.only(top: 15),
        child: ListView(
          children: [
            Text(
              AppText.messages,
              style: textStyleColored(FontWeight.bold, 20, Colors.black),
            ),
            MessageListView(_listMessage)
          ],
        ),
      );
}
