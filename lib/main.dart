import 'package:flutter/material.dart';
import 'package:vchat_frontend/app/app.dart';
import 'package:vchat_frontend/routes/chat_route.dart';

void main(List<String> args) {
  runApp(const VChatApplication(homePage: ChatRoute()));
}

