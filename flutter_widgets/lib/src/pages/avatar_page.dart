import 'package:flutter/material.dart';
 
class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(                
        appBar: AppBar(          
          title: Text('Pagina avatar'),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text("SL"),
                backgroundColor: Colors.brown,
                
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://i0.pngocean.com/files/1000/98/498/bruce-banner-she-hulk-iron-man-computer-icons-she-hulk.jpg"),  
                radius: 25.0,              
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage("https://i1.wp.com/culturageek.com.ar/wp-content/uploads/2020/04/Culturageek.com_.ar-Edward-Norton-The-Incredible-Hulk-1.jpg?fit=1200%2C675&ssl=1"),
            placeholder: AssetImage("assets/jar-loading.gif"),
          ),
        ),
      ),
    );

  }
}