import 'package:flutter/material.dart';
import 'package:market_place_task/view/list_page.dart';
import 'package:market_place_task/view/single_post_view_page.dart';
import 'package:market_place_task/widget/bottom_nav_page.dart';
import 'package:market_place_task/widget/dummy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavPage(),
    );
  }
}
