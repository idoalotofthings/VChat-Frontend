import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vchat_frontend/bloc/chat_event.dart';
import 'package:vchat_frontend/bloc/chat_state.dart';
import 'package:vchat_frontend/model/message.dart';
import 'package:vchat_frontend/repository/chatbot_repository.dart';

class ChatBloc extends Bloc<ChatEvent, List<ChatState>> {

  final repository = ChatbotRepository("http://localhost:8080");

  ChatBloc() : super(List.empty()) {

    on<QuestionsRequestedEvent>((event, emit)  async {
      print("HERE");
      final queries = await repository.getChildQueriesAtNodeId(event.nodeId);
      print("NOT HERE");
      emit(queries.map((it) => ChatState(Message(it.question, false), it.nodeId, true)).toList());
    });

    on<AnswerRequestedEvent>((event, emit) {
      emit([ChatState(Message(event.question, true), event.nodeId, false)]);
      final answer = repository.getAnswerFromNodeId(event.nodeId);
      emit([ChatState(Message(answer, false), event.nodeId, false)]);
    });

    on<Initial>((event, emit) => emit([]),);

  }

}
