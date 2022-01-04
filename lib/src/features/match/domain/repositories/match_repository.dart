import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/core/params/new_message_parameter.dart';
import 'package:dating/src/presentation/features/matches/model/matches_model.dart';
import 'package:dating/src/presentation/features/message/model/messages_model.dart';

abstract class MatchRepository {
  Future<List<MatchesModel>> getMatches(DiscoverParameter params);
  Future<List<MessageModel>> getLasMessages(DiscoverParameter params);
  Future<int> sendMessage(NewMessageParameter params);
}