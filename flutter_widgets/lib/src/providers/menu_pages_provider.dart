import 'package:flutter/services.dart' show rootBundle; //Servicio necesario para la lectura de JSON

class _MenuPagesProvider {

  List<dynamic> opcion = [];

  _MenuPagesProvider(){

    loadData();

  }

  loadData() {
    //Objeto necesario para leer el JSON
    rootBundle.loadString("lib/data/localJsonFile/menu_opts.json").then( (value) => print(value) );

  }

}

//Creamos el menu estatico para tener el menu a mano
final menuProvider = new _MenuPagesProvider();