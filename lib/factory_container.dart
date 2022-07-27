import 'package:flutter/material.dart';

class FactoryContainer extends StatelessWidget {
  final String text;
  final Color? color;

  FactoryContainer._(
    this.text, {
    this.color,
  });

  factory FactoryContainer.onlyText(String text) {
    print('onlyText 생성');
    return FactoryContainer._(text);
  }

  factory FactoryContainer.withColor(
    String text, {
    Color? color,
  }) {
    print('withColor 생성');
    return FactoryContainer._(text, color: color);
  }

  @override
  Widget build(BuildContext context) {
    print('Container 생성');
    return Container(
      color: color ?? Colors.red,
      child: Text(text),
    );
  }
}
