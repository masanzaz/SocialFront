import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/disability/domain/models/disability_model.dart';
import 'package:dating/src/features/disability/presentation/bloc/bloc.dart';
import 'package:dating/src/features/disability/presentation/helper/disability_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisabilityList extends StatefulWidget {
  @override
  DisabilityListState createState() => DisabilityListState();
}

class DisabilityListState extends State<DisabilityList> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }
  _loadAlbums() async {
    context.read<RemoteDisabilitiesBloc>().add(ServiceLoad());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<RemoteDisabilitiesBloc, RemoteDisabilitiesState>(
        builder: (context, RemoteDisabilitiesState state) {
          switch (state.status) {
            case DisabilityStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case DisabilityStatus.success:
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 0.7,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: state.disabilities.length,
                itemBuilder: (ctx, index) {
                  return _itemView(state.disabilities[index], state.disabilities);
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  _itemView(DisabilityModel model, List<DisabilityModel> hobbies) => OutlinedButton(
    style: _itemStyle(model),
    onPressed: () {
      _markSelection(model, hobbies);
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

  ButtonStyle _itemStyle(DisabilityModel model) =>
      Theme.of(context).outlinedButtonTheme.style!.copyWith(
          alignment: Alignment.centerLeft,
          backgroundColor: MaterialStateProperty.all(model.isSelected
              ? Theme.of(context).primaryColor
              : Colors.white));

  Text _itemTitle(DisabilityModel model) {
    return Text(
      model.disability,
      style: textStyleColored(FontWeight.normal, 16,
          model.isSelected ? Colors.white : Colors.black),
    );
  }

  Icon _itemIcon(DisabilityModel model) {
    return Icon(
      model.iconData,
      color: model.isSelected ? Colors.white : Theme.of(context).primaryColor,
      size: 18,
    );
  }

  void _markSelection(DisabilityModel model, List<DisabilityModel> _list) {
    setState(() {
      DisabilitiestHelper.markSelection(model, _list);
    });
  }
}
