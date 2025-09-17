import 'package:flutter/material.dart';
import 'package:market_place_task/widget/text_widget.dart';

class AppUtils {
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color backgroundColor = const Color(0xFFFE4545),
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TextWidget(text: message),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
