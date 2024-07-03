import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;

  const DescriptionWidget({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.color = Colors.black87,
    this.fontSize = 14.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}
