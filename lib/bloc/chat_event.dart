abstract class ChatEvent {
  const ChatEvent();
}

class AnswerRequestedEvent extends ChatEvent {
  final String question;
  final String nodeId;
  const AnswerRequestedEvent(this.nodeId, this.question);
}

class QuestionsRequestedEvent extends ChatEvent {
  final String nodeId;
  const QuestionsRequestedEvent(this.nodeId);
}

class Initial extends ChatEvent {}