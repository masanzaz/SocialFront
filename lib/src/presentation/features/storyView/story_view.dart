import 'dart:async';

import 'package:dating/src/core/params/new_message_parameter.dart';
import 'package:dating/src/core/utils/navigator.dart';
import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/utils/utils.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/match/data/repositories/match_repository_impl.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';
import 'package:dating/src/presentation/features/message/model/activities_model.dart';
import 'package:dating/src/presentation/features/storyView/helper/timer_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoryView extends StatefulWidget {
  final MatchesModel activitiesModel;
  const StoryView({required this.activitiesModel});

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  final StoryProgressStream _timerStream = StoryProgressStream();
  final myController = TextEditingController();
  late Timer _timer;
  bool _timerStop = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    _startStoryTimer();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    _timerStream.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _timerStop = !_timerStop;
      },
      onLongPress: () {
        _timerStop = true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: _storyImage(),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: _userSection(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child: _messageField(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Hero _storyImage() {
    return Hero(
      tag: widget.activitiesModel.id.toString(),
      child: networkImage(widget.activitiesModel.image),
    );
  }

  Widget _userSection() => Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 0),
        child: Wrap(
          runSpacing: 20,
          children: [
            StreamBuilder<double>(
                initialData: 0.0,
                stream: _timerStream.progressTimeStream,
                builder: (context, snapshot) {
                  return LinearProgressIndicator(
                    value: snapshot.data,
                    minHeight: 2.5,
                    color: Theme.of(context).primaryColor,
                  );
                }),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: CircleAvatar(
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.1),
                backgroundImage: NetworkImage(
                  widget.activitiesModel.image,
                ),
              ),
              title: Text(
                widget.activitiesModel.name,
                style: textStyleColored(FontWeight.bold, 16, Colors.white),
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _messageField() => Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: false,
                controller: myController,
                onEditingComplete: () {
                  dismissKeyboard(context);
                },
                onTap: () {
                  _timerStop = true;
                },
                textInputAction: TextInputAction.done,
                style: textStyleColored(FontWeight.normal, 16, Colors.white),
                decoration: InputDecoration(
                    hintText: AppText.yourMessage,
                    disabledBorder: InputBorder.none,
                    focusedBorder: inputBorderOutlineWhite,
                    enabledBorder: inputBorderOutlineWhite,
                    isDense: true,
                    hintStyle:
                        textStyleColored(FontWeight.normal, 16, Colors.white),
                    border: inputBorderOutlineWhite),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () async {
              if(myController.text.isNotEmpty)
                {
                    PersonRepositoryImpl repoPerson = new PersonRepositoryImpl();
                    var person = await repoPerson.getPerson();
                    MatchRepositoryImpl repo = new MatchRepositoryImpl();
                    NewMessageParameter param = new NewMessageParameter(matchId: widget.activitiesModel.id, senderId: person.id??0,
                        message: myController.text);
                    await repo.sendMessage(param);
                    AppNavigator.navigateToScreen(
                        context, AppRoutes.dashboard, 2);
                }
              },
              child: Container(
                padding: EdgeInsets.all(11.5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      );

  _startStoryTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (_timerStream.elapsedDuration == _timerStream.maxStoryDuration) {
        timer.cancel();
        Navigator.pop(context);
      }
      if (!_timerStop) _timerStream.addValue();
    });
  }
}
