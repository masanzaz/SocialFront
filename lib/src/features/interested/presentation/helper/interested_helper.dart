import 'package:dating/src/features/gender/domain/models/gender_model.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';

class InterestedHelper {
  static markSelection(GenderModel model, List<GenderModel> list) {
    list.forEach((element) async {
      if (model.id == element.id) {
        element.isSelected = !element.isSelected;
        PersonRepository repo = new PersonRepositoryImpl();
        var person = await  repo.getPerson();
        person.interestedId = model.id;
        repo.savePerson(person);
        if(element.isSelected)
          clearSelection(model, list);
        return;
      }
    });
  }

  static clearSelection(GenderModel model, List<GenderModel> list){
    list.forEach((element) {
      if (model.id != element.id) {
        element.isSelected = false;
      }
    });
  }

}
