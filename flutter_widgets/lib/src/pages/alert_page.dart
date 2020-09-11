import 'package:flutter/material.dart';
 
class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pagina alertas'),
          
        ),
        floatingActionButton: FloatingActionButton( 
          onPressed: () { Navigator.pop(context); }, //Pop es el metodo para cerrar una Pantalla
          child: Icon(Icons.all_out) ),
      ),
    );

  }
}