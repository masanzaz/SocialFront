import 'package:dating/src/core/params/request_parameter.dart';
import 'package:dating/src/features/hobbie/domain/repositories/hobby_repository.dart';
import 'package:dating/src/core/utils/resources/constants.dart';
import 'dart:convert' as convert;
import 'package:dating/src/features/hobbie/domain/models/interest_model.dart';
import 'package:http/http.dart' as http;

class HobbyRepositoryImpl implements HobbyRepository {
  //final APIService apiService;
 // const HobbyRepositoryImpl(this.apiService);
  //const HobbyRepositoryImpl();
  final _path = 'Hobby';
  @override
  Future<List<InterestModel>> getAllHobbies(RequestParameter params) async {
    var url = Uri.parse(BaseUrl + _path);
    var response = await http.get(url);
    List jsonResponse  = convert.jsonDecode(response.body)["data"];
    return jsonResponse.map((data) => new InterestModel.fromJson(data)).toList();
  }
}