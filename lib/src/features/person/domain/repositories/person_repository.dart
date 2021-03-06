import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/core/params/new_match_parameter.dart';
import 'package:dating/src/features/person/domain/models/person_model.dart';
import 'package:dating/src/features/person/domain/models/update_person_model.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'dart:io';

abstract class PersonRepository {
  Future<int> registerPerson(PersonModel person);
  Future<int> updatePerson(UpdatePersonModel person);
  Future<List<DiscoverPersonalModel>> discoverPersons(DiscoverParameter params);
  Future<PersonModel> getPersonByPhone(String phoneNumber);
  Future<PersonModel> getPersonById(int personId);
  Future<int> sendMatch(NewMatchParameter params);

  Future<File> urlToFile(String imageUrl);

  //Local
  void savePerson(PersonModel person);
  Future<PersonModel> getPerson();
}