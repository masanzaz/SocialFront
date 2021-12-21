import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class APIServices {
  static String baseUrl = 'https://127.0.0.1:5000';
  static String hobbiesUrl = '/api/v1/Hobby';

  static Future fetchHobbies() async {

      var url = Uri.parse('http://192.168.2.47:8085/api/v1/Hobby');

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      return response;

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