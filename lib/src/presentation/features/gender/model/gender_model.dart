import 'package:dating/src/presentation/components/resources/app_text.dart';

class GenderModel {
  String gender;
  int id;
  bool isSelected;

  GenderModel({
    required this.gender,
    required this.id,
    required this.isSelected,
  });

  static List<GenderModel> items() {
    List<GenderModel> _list = [];
    _list.add(GenderModel(gender: AppText.woman, id: 1, isSelected: false));
    _list.add(GenderModel(gender: AppText.man, id: 2, isSelected: false));
    _list.add(GenderModel(gender: AppText.other, id: 3, isSelected: false));
    return _list;
  }
}
