import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget pad({double padding = 8.0}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}