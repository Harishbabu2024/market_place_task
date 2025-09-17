import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color color;
  final int? maxLines;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow? overflow;

  const TextWidget({
    super.key,
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    required this.text,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      softWrap: true,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
