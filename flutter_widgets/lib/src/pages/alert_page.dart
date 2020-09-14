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
        body: Center(
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.red,
            child: Text("Mostrar alerta"),
            shape: StadiumBorder(),
            onPressed: () {
              _mostrarAlerta(context);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton( 
          onPressed: () { Navigator.pop(context); }, //Pop es el metodo para cerrar una Pantalla
          child: Icon(Icons.all_out) ),
      ),
    );

  }


  void _mostrarAlerta(BuildContext contextoApp){

    showDialog(
      context: contextoApp,
      barrierDismissible: true, //Cerrar alerta haciendo click fuera
      
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        title: Text("Titulo alerta",),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Contenido"),
            FlutterLogo(size: 100.0,)
          ], 
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text("Aceptar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    )
    );

  }
}