import 'package:dating/src/presentation/features/gender/model/gender_model.dart';

class GenderHelper {
  static markSelection(GenderModel model, List<GenderModel> list) {
    list.forEach((element) {
      if (model.id == element.id) {
        element.isSelected = !element.isSelected;
      } else {
        element.isSelected = false;
      }
    });
  }
}
