import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{

  final opciones = ["Uno", "Dos", "Tres"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets flutter")
        ),
      body: ListView(
        //children: _crearItems(),
        children: _crearItemsCorto(),
      ),
        
      );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
        );
        lista..add(tempWidget)
              ..add(Divider(color: Color(0xff2980b9), thickness: 2.0, height: 8.00,));
    }

    return lista;

  }

  List<Widget> _crearItemsCorto(){
    
    var widgets = opciones.map( (stringList) {

      return Column(
        children: [
          ListTile(

            title: Text(stringList + "!!"),
            subtitle: Text(stringList + "-2"),
            leading: Icon(Icons.ac_unit), //Icono antes del titulo
            trailing: Icon(Icons.keyboard_arrow_right), //Icono tras titulo
            onTap: (){}, //Funcion para pulsar
          ),
          Divider(color: Color(0xff2980b9), thickness: 2.0, height: 8.00,)
        ],
      );

    }).toList();
    
    return widgets;
  }

}