import 'package:dating/src/features/hobbie/domain/models/interest_model.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';

class InterestHelper {
  static markSelection(InterestModel model, List<InterestModel> list) async {
    PersonRepository repo = new PersonRepositoryImpl();
    var person = await  repo.getPerson();
    list.forEach((element) {
      if (model.id == element.id) {
        element.isSelected = !element.isSelected;
        if(element.isSelected) {
          if(person.hobbies == null)
          {
            person.hobbies = <int>[];
            person.hobbies?.add(model.id);
          }
          else
          {
            if(!(person.hobbies?.any((x) => x == element.id)?? false))
              person.hobbies?.add(model.id);
          }
        }
        else
        {
          if(person.hobbies?.any((x) => x == element.id)?? false)
            person.hobbies?.remove(model.id);
        }
        return;
      }
    });
    repo.savePerson(person);
  }
}
