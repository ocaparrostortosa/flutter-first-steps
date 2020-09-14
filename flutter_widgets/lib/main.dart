import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/pages/alert_page.dart';
import 'package:flutter_widgets/src/routes/routes.dart'; //Rutas de las aplicaciones
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      //home: HomePagePages(),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,      
      routes: getApplicationRoutes(), //Metodo para obtener las rutas de router.dart
      onGenerateRoute: (settings) { //Metodo a ejecutar cuando se genere una ruta con nombre
        print("Ruta llamada ${settings.name}"); 
        return MaterialPageRoute (builder: (BuildContext context) => AlertPage());        
        }, //Definimos las rutas para las paginas en la app
    );
  }
}