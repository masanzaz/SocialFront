import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/interest/domain/models/interest_model.dart';
import 'package:dating/src/features/interest/presentation/helper/interest_helper.dart';
import 'package:flutter/material.dart';

class InterestListWidget extends StatefulWidget {
  final List<InterestModel> list;

  const InterestListWidget({required this.list});

  @override
  _InterestListWidgetState createState() => _InterestListWidgetState();
}

class _InterestListWidgetState extends State<InterestListWidget> {
  List<InterestModel> get _list => widget.list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 0.7,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      itemCount: _list.length,
      itemBuilder: (ctx, index) {
        return _itemView(_list[index]);
      },
    );
  }

  _itemView(InterestModel model) => OutlinedButton(
        style: _itemStyle(model),
        onPressed: () {
          _markSelection(model);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _itemIcon(model),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: _itemTitle(model),
            ),
          ],
        ),
      );

  ButtonStyle _itemStyle(InterestModel model) =>
      Theme.of(context).outlinedButtonTheme.style!.copyWith(
          alignment: Alignment.centerLeft,
          backgroundColor: MaterialStateProperty.all(model.isSelected
              ? Theme.of(context).primaryColor
              : Colors.white));

  Text _itemTitle(InterestModel model) {
    return Text(
      model.interest,
      style: textStyleColored(FontWeight.normal, 16,
          model.isSelected ? Colors.white : Colors.black),
    );
  }

  Icon _itemIcon(InterestModel model) {
    return Icon(
      model.iconData,
      color: model.isSelected ? Colors.white : Theme.of(context).primaryColor,
      size: 18,
    );
  }

  void _markSelection(InterestModel model) {
    setState(() {
      InterestHelper.markSelection(model, _list);
    });
  }
}
