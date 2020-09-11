import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/providers/menu_pages_provider.dart';
import 'package:flutter_widgets/src/utils/icono_string_util.dart';
 
class HomePagePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pages"),
      ),
      body: _lista(),
      );
  }
}


Widget _lista(){

  return FutureBuilder(

    future: menuProvider.loadData(),
    initialData: [], 
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) { 

      return ListView(

        children: _listaItems(snapshot.data),

      );

     },
    

  );

}

List<Widget> _listaItems(List<dynamic> datos) {

  final List<Widget> opciones = [];

  datos.forEach((element) {
    
    final widgetTemp = ListTile(

      title: Text(element["texto"]),
      leading: getIcon(element["icon"]), //Icono en base al string
      trailing: Icon(Icons.format_align_right),

    );

    opciones..add(widgetTemp)..add( Divider( color: Colors.cyan, ) );

  });

  return opciones;

}