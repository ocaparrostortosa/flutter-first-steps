//Utilidad para poder asignar un icono string a un icono de la aplicacion

import 'package:flutter/material.dart';

//Mapa del icono
final _icono = <String, IconData>{

  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'donut_large'   : Icons.donut_large,
  'input'         : Icons.input,
  'tune'          : Icons.tune,
  'list'          : Icons.list

};

Icon getIcon(String nombreIcono) => Icon(_icono[nombreIcono], color: Colors.blue);

