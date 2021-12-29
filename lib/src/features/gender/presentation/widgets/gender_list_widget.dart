import 'package:dating/src/core/utils/resources/app_color.dart';
import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/gender/domain/models/gender_model.dart';
import 'package:dating/src/features/gender/presentation/bloc/bloc.dart';
import 'package:dating/src/features/gender/presentation/helper/gender_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderList extends StatefulWidget {

  @override
  _GenderListWidgetState createState() => _GenderListWidgetState();
}

class _GenderListWidgetState extends State<GenderList> {
  @override
  void initState() {
    super.initState();
    _loadGenres();
  }
  _loadGenres() async {
    context.read<GenderBloc>().add(ServiceLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderBloc, GenderState>(
        builder: (context, GenderState state) {
          switch (state.status) {
            case GenderStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case GenderStatus.success:
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.genders.length,
                itemBuilder: (ctx, index) {
                  return _itemView(state.genders[index], state.genders);
                },
              );
            default:
              return const Center(child: Text('Loading...'));
          }
        }
    );
  }

  _itemView(GenderModel model, List<GenderModel> _list) => Container(
      margin: EdgeInsets.only(bottom: 8),
      child: OutlinedButton(
        style: _itemStyle(model),
        onPressed: () {
          _markSelection(model, _list);
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

  void _markSelection(GenderModel model, List<GenderModel> _list) {
    setState(() {
      GenderHelper.markSelection(model, _list);
    });
  }
}
