import 'package:dating/src/features/gender/domain/models/gender_model.dart';

class InterestInHelper {
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
