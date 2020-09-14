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
  TextEditingController _inputFieldDateController =
      new TextEditingController(); //Controlador de la fecha en la caja de texto

  int _longitudMax = 20;
  int _longitudNombre = 20;

  List<String> _ataques = ['Arañazo', 'Latigo zepa', 'Cabezazo'];
  String _opcionSeleccionada =
      "Arañazo"; //Valor por defecto de la opcion de ataques

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
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
          _crearDropwDown(),
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
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
          _longitudNombre = _longitudMax - valor.length;
        });
      },
    );
  }

//Lista de elementos para el dropdown
  List<DropdownMenuItem<String>> _getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = new List();

    _ataques.forEach((ataque) {
      lista.add(DropdownMenuItem(
        child: Text(ataque),
        value: ataque,
      ));
    });

    return lista;
  }

  Widget _crearDropwDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 40.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: _getOpcionesDropDown(),
            onChanged: (opcion) {
              setState(() {
                _opcionSeleccionada = opcion;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
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
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearPassword() {
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
      onChanged: (valor) => setState(() {
        _password = valor;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
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
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionarFecha(context);
      },
    );
  }

  _seleccionarFecha(BuildContext context) async {
    DateTime seleccionada = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'), //Idioma
    );

    if (seleccionada != null) {
      setState(() {
        _fecha = seleccionada.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
