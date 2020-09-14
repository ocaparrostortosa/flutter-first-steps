import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _nombre = "";
  int _longitudMax = 20;
  int _longitudNombre = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inputs"),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[          
          _crearInput(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(

      //autofocus: true,
      maxLength: _longitudMax,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text("Longitud ${_longitudNombre}"),
        hintText: "Introduzca el nombre",
        labelText: "Nombre",
        helperText: "Solo es el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.supervised_user_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),        
      ),
      onChanged: (valor){         
        setState(() {
          _nombre = valor;
          _longitudNombre = _longitudMax - valor.length;
        });
      },

    );

  }


  Widget _crearPersona(){
    return ListTile(

      title: Text("Nombre es: $_nombre"),

    );
  }
}