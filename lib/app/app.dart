import 'package:flutter/material.dart';
import 'package:vchat_frontend/theme/theme.dart';

class VChatApplication extends StatelessWidget {
  
  final Widget homePage;

  const VChatApplication({required this.homePage, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true
      ),
      home: homePage,
    ); 
  }
}