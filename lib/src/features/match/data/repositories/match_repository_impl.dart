import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/core/params/new_message_parameter.dart';
import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:dating/src/features/match/domain/repositories/match_repository.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';
import 'package:dating/src/presentation/features/message/model/messages_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MatchRepositoryImpl implements MatchRepository {

  Future<List<MatchesModel>> getMatches(DiscoverParameter params) async {
    final _path = 'Person/GetMatches?MatchId='+params.personId.toString()+'&PageNumber=1&PageSize=1000';
    var url = Uri.parse(BaseUrl + _path);
    var response = await http.get(url);
    List jsonResponse  = convert.jsonDecode(response.body)["data"];
    return jsonResponse.map((data) => new MatchesModel.fromJson(data)).toList();
  }

  Future<List<MessageModel>> getLasMessages(DiscoverParameter params) async {
    final _path = 'Chat/getLastMessages?MatchId='+params.personId.toString()+'&PageNumber=1&PageSize=1000';
    var url = Uri.parse(BaseUrl + _path);
    var response = await http.get(url);
    List jsonResponse  = convert.jsonDecode(response.body)["data"];
    return jsonResponse.map((data) => new MessageModel.fromJson(data)).toList();
  }

  Future<int> sendMessage(NewMessageParameter params) async {
    var path =  'Chat/send-message';
    var url = Uri.parse(BaseUrl + path);
    var body = convert.jsonEncode(params);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return convert.jsonDecode(response.body)["data"];
  }


}