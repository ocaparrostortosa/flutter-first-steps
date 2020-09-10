import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/pages/home_pages.dart';
import 'package:flutter_widgets/src/pages/home_temp_lists.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      home: HomePagePages(),
      debugShowCheckedModeBanner: false,
    );
  }
}