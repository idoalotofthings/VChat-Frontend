import 'package:vchat_frontend/model/message.dart';

class ChatState {
  final Message message;
  final String currentNodeId;
  final bool isQuestion;

  const ChatState(this.message, this.currentNodeId, this.isQuestion);
}