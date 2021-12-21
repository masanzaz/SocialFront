import 'dart:convert' as convert;
import 'package:dating/src/domain/params/request_parameter.dart';
import 'package:http/http.dart' as http;

class APIService {
  static String baseUrl = 'https://127.0.0.1:5000';
  static String hobbiesUrl = '/api/v1/Hobby';
  final _baseUrl = 'http://172.16.40.166:8085/api/v1/Hobby';

  Future getHobbies(RequestParameter params) async {
      var url = Uri.parse(_baseUrl);
      var response = await http.get(url);
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      return response;
      if (response.statusCode != 200) {
        throw new Exception('error getting quotes');
      }

      if (response.statusCode == 200) {
        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        var itemCount = jsonResponse['totalItems'];
        print('Number of books about http: $itemCount.');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
  }



}