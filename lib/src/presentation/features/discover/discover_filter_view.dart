import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/utils/resources/app_text.dart';
import 'package:dating/src/core/theme/app_theme.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/gender/data/repositories/gender_repository_impl.dart';
import 'package:dating/src/features/gender/domain/models/gender_model.dart';
import 'package:dating/src/presentation/features/discover/helper/interest_in_helper.dart';
import 'package:dating/src/presentation/features/discover/model/intrest_in_model.dart';
import 'package:flutter/material.dart';

class DiscoverFilterView extends StatefulWidget {
  const DiscoverFilterView({Key? key}) : super(key: key);

  @override
  _DiscoverFilterViewState createState() => _DiscoverFilterViewState();
}

class _DiscoverFilterViewState extends State<DiscoverFilterView> {
  var _list = <GenderModel>[];

  @override
  void initState() {
    super.initState();
    _loadPersons();
  }

  _loadPersons() async {
    GenderRepositoryImpl repo = new GenderRepositoryImpl();
    repo.getAllGenders().then((persons) {
      setState(() {
        _list = persons;
      });
    });
  }


  TextEditingController _controller = TextEditingController();
  double _distance = 5.0;
  double _ageStart = 18;
  double _ageEnd = 28;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) =>
          Scaffold(
        appBar: _appBar(context),
        body: Container(
          margin: EdgeInsets.only(left: 25, right: 25, top: 20),
          child: ListView(
            shrinkWrap: true,
            controller: scrollController,
            children: [
              _interestWidget(),
              SizedBox(height: 15),
              _locationField(),
              SizedBox(height: 15),
              _distanceSlider(),
              SizedBox(height: 15),
              _ageSlider(),
              SizedBox(height: 40),
              _confirmButton()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          AppText.filters,
          style: textStyleColored(FontWeight.bold, 20, Colors.black),
        ),
      ),
      leading: Container(),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20, top: 10),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            child: Text(
              AppText.clear,
              style: textStylePrimary(context, FontWeight.bold, 14),
            ),
          ),
        )
      ],
    );
  }

  Widget _interestWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.interestedIn,
            style: textStyleColored(FontWeight.bold, 15, Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppThemeData.CircularRadius),
                border: Border.all(color: Colors.grey.withOpacity(0.0))),
            child: Row(
              children: List.generate(_list.length, (index) {
                var data = _list[index];
                return Expanded(
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppThemeData.CircularRadius),
                    onTap: () {
                      setState(() {
                        InterestInHelper.markSelection(data, _list);
                      });
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppThemeData.CircularRadius),
                        color: data.isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          data.gender,
                          textAlign: TextAlign.center,
                          style: textStyleColored(FontWeight.normal, 14,
                              data.isSelected ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      );

  Widget _locationField() => TextField(
        controller: _controller,
        style: textStyleColored(
            FontWeight.normal, 14, AppColor.blackShadeTextColor),
        decoration: InputDecoration(
            hintText: AppText.location,
            disabledBorder: InputBorder.none,
            focusedBorder: inputBorderOutline,
            enabledBorder: inputBorderOutline,
            isDense: true,
            border: inputBorderOutline),
      );

  Widget _distanceSlider() => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppText.distance,
                  style: textStyleColored(FontWeight.bold, 15, Colors.black),
                ),
              ),
              Text(
                "$_distance Km",
                style: textStyleColored(FontWeight.normal, 13, Colors.black),
              )
            ],
          ),
          Slider(
              max: 50,
              divisions: 10,
              min: 1,
              value: _distance,
              onChanged: (value) {
                setState(() {
                  _distance = value.toInt().toDouble();
                });
              })
        ],
      );

  Widget _ageSlider() => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppText.age,
                  style: textStyleColored(FontWeight.bold, 15, Colors.black),
                ),
              ),
              Text(
                "$_ageStart - $_ageEnd",
                style: textStyleColored(FontWeight.normal, 13, Colors.black),
              )
            ],
          ),
          RangeSlider(
              max: 60,
              min: 18,
              values: RangeValues(_ageStart, _ageEnd),
              onChanged: (value) {
                setState(() {
                  _ageStart = value.start.toInt().toDouble();
                  _ageEnd = value.end.toInt().toDouble();
                });
              })
        ],
      );

  _confirmButton() => Container(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              AppText.continueText,
              style: textStyleColored(FontWeight.bold, 16, null),
            )),
      );
}
