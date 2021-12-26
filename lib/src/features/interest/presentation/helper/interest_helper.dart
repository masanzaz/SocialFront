import 'package:dating/src/features/interest/domain/models/interest_model.dart';

class InterestHelper {
  static markSelection(InterestModel model, List<InterestModel> list) {
    list.forEach((element) {
      if (model.id == element.id) {
        element.isSelected = !element.isSelected;
        return;
      }
    });
  }
}