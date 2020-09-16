import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sliders")),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
      );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigo,
      label: "Tamaño imagen",
      //divisions: 20,      
      value: _valorSlider,
      onChanged: (_bloquearCheck) ? null : (valor){ //Para deshabilitar widgets evitamos ejecutar el onState con un null
        setState(() {
          _valorSlider = valor;
        });
      },
      min: 10.0,
      max: 400.0,
      
    );

  }

  Widget _crearImagen() {

    return Image(

      image: NetworkImage("https://upload.wikimedia.org/wikipedia/en/a/aa/Hulk_%28circa_2019%29.png"), 
      width: _valorSlider,
      fit: BoxFit.contain,
      

    );

  }

  Widget _crearCheckBox() {
    /*
    return Checkbox(

      value: _bloquearCheck,
      onChanged: (valor){

        setState(() {
          _bloquearCheck = valor;
        });

      },

    );*/

    return CheckboxListTile(

      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (valor){

        setState(() {
          _bloquearCheck = valor;
        });

      },

    );

  }

  Widget _crearSwitch() {

    return SwitchListTile(

      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (valor){

        setState(() {
          _bloquearCheck = valor;
        });

      },

    );

  }
}