import 'package:dating/src/core/params/request_parameter.dart';
import 'package:dating/src/features/disability/domain/models/disability_model.dart';
import 'package:dating/src/features/disability/domain/repositories/disability_repository.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:dating/src/core/utils/resources/constants.dart';
class DisabilityRepositoryImpl implements DisabilityRepository {
  final _path = 'Disability';
  @override
  Future<List<DisabilityModel>> getAllDisabilities(RequestParameter params) async {
    var url = Uri.parse(BaseUrl + _path);
    var response = await http.get(url);
    List jsonResponse  = convert.jsonDecode(response.body)["data"];
    return jsonResponse.map((data) => new DisabilityModel.fromJson(data)).toList();
  }
}