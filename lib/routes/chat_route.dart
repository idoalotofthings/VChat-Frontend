import 'package:flutter/material.dart';
import 'package:vchat_frontend/ui/chat_history.dart';

class ChatRoute extends StatefulWidget {
  const ChatRoute({super.key});

  @override
  State<ChatRoute> createState() => _ChatRouteState();
}

class _ChatRouteState extends State<ChatRoute> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VChat"),
      ),
      body: const Center(
        child: ChatWidget(),
      ),
    );
  }
}
