import 'package:flutter/services.dart' show rootBundle; //Servicio necesario para la lectura de JSON
import 'dart:convert'; //Libreria para usar el objeto json

class _MenuPagesProvider {

  List<dynamic> opcion = [];

  _MenuPagesProvider(){

    //loadData();

  }

  Future<List<dynamic>> loadData() async{
    //Objeto necesario para leer el JSON
      final resp = await rootBundle.loadString("lib/data/localJsonFile/menu_opts.json");

      Map datamap = json.decode(resp);

      opcion = datamap['rutas'];

    return opcion;

  }

}

//Creamos el menu estatico para tener el menu a mano
final menuProvider = new _MenuPagesProvider();