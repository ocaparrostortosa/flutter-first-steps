import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/pages/alert_page.dart';
import 'package:flutter_widgets/src/pages/animated_container.dart';
import 'package:flutter_widgets/src/pages/avatar_page.dart';
import 'package:flutter_widgets/src/pages/card_pages.dart';
import 'package:flutter_widgets/src/pages/home_pages_json_list.dart';
import 'package:flutter_widgets/src/pages/inputs_page.dart';
import 'package:flutter_widgets/src/pages/listview_page.dart';
import 'package:flutter_widgets/src/pages/sliders_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){


return <String, WidgetBuilder>{ //Este metodo son para pocas rutas
        '/'                 : (BuildContext context) => HomePagePages(),
        'alert'             : (BuildContext context) => AlertPage(),
        'avatar'            : (BuildContext context) => AvatarPage(),
        'card'              : (BuildContext context) => CardPage(),
        'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
        'inputs'            : (BuildContext context) => InputsPage(),
        "slider"            : (BuildContext context) => SliderPage(),
        'list'              : (BuildContext context) => ListaPage(),
};

}