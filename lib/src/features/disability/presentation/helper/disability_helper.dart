import 'package:dating/src/features/disability/domain/models/disability_model.dart';

class DisabilitiestHelper {
  static markSelection(DisabilityModel model, List<DisabilityModel> list) {
    list.forEach((element) {
      if (model.id == element.id) {
        element.isSelected = !element.isSelected;
        return;
      }
    });
  }
}
