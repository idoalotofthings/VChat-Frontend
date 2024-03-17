import 'package:flutter/material.dart';
import 'package:vchat_frontend/ext/object_ext.dart';
import 'package:vchat_frontend/ext/widget_ext.dart';

class ChatElement extends StatelessWidget {
  final String message;
  final bool isQuestion;
  final bool byUser;
  final void Function() onClick;
  final void Function() onMoreClick;

  const ChatElement(this.message, this.isQuestion, this.byUser,
      this.onMoreClick, this.onClick,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          byUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        byUser
            ? const Icon(Icons.account_circle)
            : const Icon(Icons.auto_awesome),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: isQuestion ? onClick : () {},
              child: Container(
                constraints: const BoxConstraints(maxWidth: 750),
                child: Card.filled(
                  child: Text(message).pad(),
                ),
              ),
            ),
            isQuestion || byUser
                ? Container()
                : GestureDetector(
                    onTap: onMoreClick,
                    child: const Text("Elaborate on this"),
                  )
          ],
        )
      ].applyIf(byUser, (it) => it.reversed.toList()),
    );
  }
}
