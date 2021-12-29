import 'package:dating/src/features/gender/domain/models/gender_model.dart';
import 'package:dating/src/features/gender/domain/repositories/gender_repository.dart';
import 'package:dating/src/core/utils/resources/constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GenderRepositoryImpl implements GenderRepository {
  final _path = 'Genre';
  @override
  Future<List<GenderModel>> getAllGenders() async {
    var url = Uri.parse(BaseUrl + _path);
    var response = await http.get(url);
    List jsonResponse  = convert.jsonDecode(response.body)["data"];
    return jsonResponse.map((data) => new GenderModel.fromJson(data)).toList();
  }
}