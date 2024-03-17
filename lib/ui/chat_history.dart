import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vchat_frontend/bloc/chat_bloc.dart';
import 'package:vchat_frontend/bloc/chat_event.dart';
import 'package:vchat_frontend/bloc/chat_state.dart';
import 'package:vchat_frontend/ext/widget_ext.dart';
import 'package:vchat_frontend/model/message.dart';
import 'package:vchat_frontend/ui/chat_element.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final chatHistory = <ChatState>[];
  final listKey = GlobalKey<AnimatedListState>();
  final scrollController = ScrollController();
  var built = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc()..add(const QuestionsRequestedEvent("0")),
      child: BlocBuilder<ChatBloc, List<ChatState>>(
        builder: (context, state) {
          for (var element in state.indexed) {
            addItem(element.$2, element.$1 == state.length-1 && built);
          }

          return AnimatedList(
            key: listKey,
            controller: scrollController,
            initialItemCount: chatHistory.length,
            itemBuilder: (context, index, animation) {
              final currentItem = chatHistory[index];
              built = true;
              return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(currentItem.message.byUser ? 1 : -1, 0),
                        end: Offset.zero)
                    .animate(animation),
                child: Align(
                  alignment: currentItem.message.byUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: ChatElement(currentItem.message.contents,
                      currentItem.isQuestion, currentItem.message.byUser, () {
                    print("${currentItem.currentNodeId}");
                    context.read<ChatBloc>().add(
                        QuestionsRequestedEvent(currentItem.currentNodeId));
                  }, () {
                    
                    addItem(ChatState(
                        Message(currentItem.message.contents, true),
                        currentItem.currentNodeId,
                        false), true);
                    context.read<ChatBloc>().add(AnswerRequestedEvent(
                        chatHistory[index].currentNodeId,
                        currentItem.message.contents));
                  }).pad(padding: 16),
                ),
              );
            },
          );
   
        },
      ),
    );
  }

  void addItem(ChatState item, bool scroll) {
    final index = chatHistory.length;
    chatHistory.add(item);
    listKey.currentState?.insertItem(index);
    
  }
}
