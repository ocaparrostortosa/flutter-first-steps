import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/pages/alert_page.dart';
import 'package:flutter_widgets/src/pages/avatar_page.dart';
import 'package:flutter_widgets/src/pages/home_pages_json_list.dart';
import 'package:flutter_widgets/src/pages/home_temp_lists.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      //home: HomePagePages(),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/'     : (BuildContext context) => HomePagePages(),
        'alert' : (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage()
      }, //Definimos las rutas para las paginas en la app
    );
  }
}