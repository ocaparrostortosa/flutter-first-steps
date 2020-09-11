import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/pages/alert_page.dart';
import 'package:flutter_widgets/src/pages/avatar_page.dart';
import 'package:flutter_widgets/src/pages/card_pages.dart';
import 'package:flutter_widgets/src/pages/home_pages_json_list.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){


return <String, WidgetBuilder>{ //Este metodo son para pocas rutas
        '/'     : (BuildContext context) => HomePagePages(),
        'alert' : (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => CardPage()
};

}