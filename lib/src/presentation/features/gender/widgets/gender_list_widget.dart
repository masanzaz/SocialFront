import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/presentation/features/gender/helper/gender_helper.dart';
import 'package:dating/src/presentation/features/gender/model/gender_model.dart';
import 'package:flutter/material.dart';

class GenderListWidget extends StatefulWidget {
  final List<GenderModel> list;

  const GenderListWidget({required this.list});

  @override
  _GenderListWidgetState createState() => _GenderListWidgetState();
}

class _GenderListWidgetState extends State<GenderListWidget> {
  List<GenderModel> get _list => widget.list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _list.length,
      itemBuilder: (ctx, index) {
        return _itemView(_list[index]);
      },
    );
  }

  _itemView(GenderModel model) => Container(
      margin: EdgeInsets.only(bottom: 8),
      child: OutlinedButton(
        style: _itemStyle(model),
        onPressed: () {
          _markSelection(model);
        },
        child: Row(
          children: [
            Expanded(
              child: _itemTitle(model),
            ),
            _itemCheck(model)
          ],
        ),
      ));

  ButtonStyle _itemStyle(GenderModel model) =>
      Theme.of(context).outlinedButtonTheme.style!.copyWith(
          alignment: Alignment.centerLeft,
          backgroundColor: MaterialStateProperty.all(model.isSelected
              ? Theme.of(context).primaryColor
              : Colors.white));

  Text _itemTitle(GenderModel model) {
    return Text(
      model.gender,
      style: textStyleColored(FontWeight.normal, 15,
          model.isSelected ? Colors.white : AppColor.blackShadeTextColor),
    );
  }

  Icon _itemCheck(GenderModel model) {
    return Icon(
      Icons.check,
      color: model.isSelected ? Colors.white : Colors.grey,
      size: 17,
    );
  }

  void _markSelection(GenderModel model) {
    setState(() {
      GenderHelper.markSelection(model, _list);
    });
  }
}
