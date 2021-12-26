import 'package:dating/src/core/widgets/app_widgets.dart';
import 'package:dating/src/features/interest/presentation/helper/interest_helper.dart';
import 'package:dating/src/features/interest/domain/models/interest_model.dart';
import 'package:dating/src/features/interest/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HobbyList extends StatefulWidget {
  @override
  HobbyListState createState() => HobbyListState();
}

class HobbyListState extends State<HobbyList> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }
  _loadAlbums() async {
    context.read<RemoteHobbiesBloc>().add(ServiceLoad());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<RemoteHobbiesBloc, RemoteHobbiesState>(
        builder: (context, RemoteHobbiesState state) {
          switch (state.status) {
            case HobbyStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case HobbyStatus.success:
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 0.7,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: state.hobbies.length,
                itemBuilder: (ctx, index) {
                  return _itemView(state.hobbies[index], state.hobbies);
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  _itemView(InterestModel model, List<InterestModel> hobbies) => OutlinedButton(
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

  void _markSelection(InterestModel model, List<InterestModel> _list) {
    setState(() {
      InterestHelper.markSelection(model, _list);
    });
  }
}
