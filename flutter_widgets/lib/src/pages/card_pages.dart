import 'package:flutter/material.dart';
 
class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card page'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: [
            cardTipo1(),
            SizedBox(height: 20.0,),
            cardTipo2(),
            SizedBox(height: 20.0,),
            cardTipo1(),
            SizedBox(height: 20.0,),
            cardTipo2(),
            SizedBox(height: 20.0,),
            cardTipo1(),
          ],
        ),
      ),
    );
  }
}

Widget cardTipo1() {
  return Card(
    elevation: 10.0, //Altitud del sombreado -- 0.0 = sin sombra
    shape: RoundedRectangleBorder( //Definimos el tipo y longitud del borde
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.android),
          title: Text("Card title"),
          subtitle: Text("Descripcion de la tarjeta pudiendo escribir un texto largo sin ningun tipo de problema"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){},
              ),
              FlatButton(
                child: Text("Aceptar"),
                onPressed: (){},
              ),
            ],
          ),
      ],
      ),
    );
}


Widget cardTipo2() {
  final card = Container(        //Se sustituye la tarjeta por el contenedor para tener mas control 
    child: Column(
      children: <Widget>[

        FadeInImage( //Recurso estatico (subspec)
          image: NetworkImage("https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration( milliseconds: 200 ),
          height: 250,
          fit: BoxFit.cover,
        ),
        /* Imagenes lentas
        Image(
          image: NetworkImage("https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg"),
        ),*/
        Container(
          child: Text("Paisaje de fondo"),
          padding: EdgeInsets.all(10.0),
          ),
      ],
    ),
  );

  return Container(
    
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26, //Nivel de opacidad
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.0, 10.0),
        ),
      ],
      //color: Colors.red
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
      
    ),
  );
}