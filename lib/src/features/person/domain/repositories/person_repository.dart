import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/features/person/domain/models/person_model.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';

abstract class PersonRepository {
  Future<int> registerPerson(PersonModel person);
  Future<List<DiscoverPersonalModel>> discoverPersons(DiscoverParameter params);

  //Local
  void savePerson(PersonModel person);
  Future<PersonModel> getPerson();
}