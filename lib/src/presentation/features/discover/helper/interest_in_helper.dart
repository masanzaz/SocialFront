import 'package:dating/src/presentation/features/discover/model/intrest_in_model.dart';

class InterestInHelper {
  static markSelection(InterestInModel model, List<InterestInModel> list) {
    list.forEach((element) {
      if (model.name == element.name) {
        element.isSelected = !element.isSelected;
      } else {
        element.isSelected = false;
      }
    });
  }
}
