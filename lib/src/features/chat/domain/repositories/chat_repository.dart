import 'package:dating/src/core/params/chat_parameter.dart';
import 'package:dating/src/presentation/features/chat/model/chat_model.dart';

abstract class ChatRepository {
  Future<List<ChatModel>> getMessages(ChatParameter params);
}