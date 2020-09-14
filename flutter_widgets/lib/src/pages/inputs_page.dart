import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _nombre = "";
  String _email = "";
  String _password = "";

  String _fecha = "";
  TextEditingController _inputFieldDateController = new TextEditingController(); //Controlador de la fecha en la caja de texto

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
          _crearEmail(),
           Divider(),
          _crearPassword(),
           Divider(),
           _crearFecha(context),
           Divider(),
          _crearPersona(),
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
      subtitle: Text("Email: $_email"),      

    );
  }


  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(        
        hintText: "Introduzca su email",
        labelText: "E-mail",        
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),        
      ),
      onChanged: (valor) => setState((){_email = valor;}),
      

    );
  }

  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(        
        hintText: "Password",
        labelText: "Password",        
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_open),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),        
      ),
      onChanged: (valor) => setState((){_password = valor;}),
      

    );
  }

  Widget _crearFecha(BuildContext context){

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController, //Controlador de la caja de texto
      decoration: InputDecoration(        
        hintText: "Fecha nacimiento",
        labelText: "Fecha",        
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),        
      ),  
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionarFecha(context);

      },

    );

  }

  _seleccionarFecha(BuildContext context) async{

    DateTime seleccionada = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'), //Idioma
    );

    if(seleccionada != null){
      setState(() {
        _fecha = seleccionada.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }



}