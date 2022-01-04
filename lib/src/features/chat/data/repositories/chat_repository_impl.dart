import 'package:dating/src/core/params/chat_parameter.dart';
import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:dating/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:dating/src/presentation/features/chat/model/chat_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ChatRepositoryImpl implements ChatRepository {

  Future<List<ChatModel>> getMessages(ChatParameter params) async {
    final _path = 'Chat/get-conversations?MatchId='+params.matchId.toString()+'&PersonId='+params.personId.toString()+'&PageNumber=1&PageSize=1000';
    var url = Uri.parse(BaseUrl + _path);
    var response = await http.get(url);
    List jsonResponse  = convert.jsonDecode(response.body)["data"];
    return jsonResponse.map((data) => new ChatModel.fromJson(data)).toList();
  }
}