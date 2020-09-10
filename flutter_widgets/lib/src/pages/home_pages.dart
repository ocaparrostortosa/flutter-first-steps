import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/providers/menu_pages_provider.dart';
 
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

  print (menuProvider.opcion);

  return ListView(

    children: _listaItems(),

  );

}

List<Widget> _listaItems() {

  return [
    ListTile(title: Text("Hola mundo"),),
    ListTile(title: Text("Hola mundo"),),
    ListTile(title: Text("Hola mundo"),)
  ];

}