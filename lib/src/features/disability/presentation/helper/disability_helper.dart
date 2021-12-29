import 'package:dating/src/features/disability/domain/models/disability_model.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';

class DisabilitiestHelper {
  static markSelection(DisabilityModel model, List<DisabilityModel> list) async {
    PersonRepository repo = new PersonRepositoryImpl();
    var person = await  repo.getPerson();
    list.forEach((element) {
      if (model.id == element.id) {
        element.isSelected = !element.isSelected;
        if(element.isSelected) {
          if(person.disabilities == null)
          {
            person.disabilities = <int>[];
            person.disabilities?.add(model.id);
          }
          else
          {
            if(!(person.disabilities?.any((x) => x == element.id)?? false))
              person.disabilities?.add(model.id);
          }
        }
        else
        {
          if(person.disabilities?.any((x) => x == element.id)?? false)
            person.disabilities?.remove(model.id);
        }
        return;
      }
    });
    repo.savePerson(person);
  }
}
