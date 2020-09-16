import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //Control del scroll en ventana
  ScrollController _controlador = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;

  bool _isLoading = false;

  //Etapa de ciclo de vida de un Stateful
  @override
  void initState() {
    super.initState();
    _agregar10();
    _controlador.addListener(() {
      //Para calcular cuando estemos en el final de la pagina
      if (_controlador.position.pixels ==
          _controlador.position.maxScrollExtent) {
        //_agregar10();

        _fetchData();
      }
    });
  }

  //Para evitar crear infinitas referencias del scrollcontroller, cuando se destruya la pagina lo vaciaremos
  @override
  void dispose() {
    super.dispose();
    _controlador.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listas")),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: () {
        return _obtenerPagina1();
      },
      child: ListView.builder(
        controller: _controlador,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int valor) {
          final imagen = _listaNumeros[valor];

          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("https://picsum.photos/500/300/?image=$imagen"),
          );
        },
      ),
    );
  }

  Future<Null> _obtenerPagina1() async{

    final duracion = new Duration(seconds: 2);
    new Timer(duracion, (){

      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();

    });

    return Future.delayed(duracion);

  }

  //Metodo para el scroll infinito
  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  //Simulamos una llamada HTTP
  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    //Simulamos el delay de una peticion http
    final _duracion = new Duration(seconds: 2);
    new Timer(_duracion, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    //Para mostrar la siguiente salida, moveremos ligeramente el scroll
    _controlador.animateTo(
      _controlador.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
