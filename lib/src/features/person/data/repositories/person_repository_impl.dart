import 'dart:convert' as convert;
import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/core/params/new_match_parameter.dart';
import 'package:dating/src/features/person/domain/models/person_model.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';
import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'package:http/http.dart' as http;
import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonRepositoryImpl implements PersonRepository {
  final _path = 'Person/register';

  Future<int> registerPerson(PersonModel person) async {
    var url = Uri.parse(BaseUrl + _path);
    var body = convert.jsonEncode(person);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return convert.jsonDecode(response.body)["data"];
  }

  Future<List<DiscoverPersonalModel>> discoverPersons(DiscoverParameter params) async {
    final _pathDiscover = 'Person/GetNoMatches?PersonId=1&PageNumber=1&PageSize=1';
    var url = Uri.parse(BaseUrl + _pathDiscover);
    var response = await http.get(url);
    List jsonResponse  = convert.jsonDecode(response.body)["data"];
    return jsonResponse.map((data) => new DiscoverPersonalModel.fromJson(data)).toList();
  }

  Future<PersonModel> getPersonById(int personId) async{
    final _pathDiscover = 'Person/GetPersonById/'+personId.toString();
    var url = Uri.parse(BaseUrl + _pathDiscover);
    var response = await http.get(url);

    var jsonResponse  = convert.jsonDecode(response.body)["data"];
    return jsonResponse.map((data) => new PersonModel.fromJson(data));
  }

  Future<PersonModel> getPersonByPhone(String phoneNumber) async {
    final _pathDiscover = 'Person/GetPersonByPhone/'+phoneNumber;
    var url = Uri.parse(BaseUrl + _pathDiscover);
    var response = await http.get(url);
    var jsonResponse  = convert.jsonDecode(response.body)["data"];
    return PersonModel.fromJson(jsonResponse);
  }

  Future<int> sendMatch(NewMatchParameter params) async {
    var path =  'Chat/new-match';
    var url = Uri.parse(BaseUrl + path);
    var body = convert.jsonEncode(params);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return convert.jsonDecode(response.body)["data"];
  }






  //Local
  void savePerson(PersonModel person) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var personJson = convert.jsonEncode(person.toJson());
    await sharedPreferences.setString('person', personJson);
  }

  Future<PersonModel> getPerson() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = sharedPreferences.getString('person');
    var personMap = convert.jsonDecode(response?? '');
    return PersonModel.fromJson(personMap);
  }

}