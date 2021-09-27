import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rasca/views/CrearActividad.dart';

class Restricciones extends StatefulWidget {
  Restricciones();
  static const routeName = '/auth';

  @override
  _Restricciones createState() => _Restricciones();
}
class _Restricciones extends State<Restricciones> {
  //Variables Globales
  TextEditingController _facultadController = TextEditingController();
  TextEditingController _anioController = TextEditingController();
  TextEditingController _becaController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var _formKeyAnio = GlobalKey<FormState>();
  var _formKeyBeca = GlobalKey<FormState>();
  String ? _facultadError;
  String ? _anioError;
  String ? _becaError;
  String ? Horas;
  int index = 0;

  //Custom text style to apply to UI elements
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
       title: 'Flutter Demo',
  theme: ThemeData(
       appBarTheme: AppBarTheme(
     color: Color(0xFF00205B),
     )
          ),
        home: Scaffold(appBar: AppBar (title: Text('Restricciones'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Form(
                  key: _formKey,
                  child: TextFormField(
                  controller: _facultadController,
                  decoration: InputDecoration(
                  hintText: "Facultad",
                  labelText: "Facultades",
                  errorText: _facultadError,
                  labelStyle: TextStyle(fontSize: 20, 
                  color: Colors.black),
                  border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: 20,),
                  Form(
                  key: _formKeyAnio,
                  child: TextFormField(
                  controller: _anioController,
                  decoration: InputDecoration(
                  hintText: "Año",
                  labelText: "Año de Carrera",
                  errorText: _anioError,
                  labelStyle: TextStyle(fontSize: 20, 
                  color: Colors.black),
                  border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: 20,),
                  Form(
                  key: _formKeyBeca,
                  child: TextFormField(
                  controller: _becaController,
                  decoration: InputDecoration(
                  hintText: "Beca",
                  labelText: "Tipo de beca",
                  errorText: _becaError,
                  labelStyle: TextStyle(fontSize: 20, 
                  color: Colors.black),
                  border: OutlineInputBorder()),
                  ),
                ),
                RaisedButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Actividad() ),);     
                     },
                    color: Color(0xFFFFCD00),
                    child: Text("Cancelar",
                    style: TextStyle(fontSize: 17)),
                      ),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                  RaisedButton(onPressed: (){
                    print("Nombre: "+_facultadController.text);
                    setState(() {
                    if(_facultadController.text.length<1)
                    _facultadError = "Debe agregar restricción";
                    else
                    _facultadError = null; 
                    });
                    setState(() {
                    if(_anioController.text.length<1)
                    _anioError = "Debe agregar restricción";
                    else
                    _anioError = null; 
                    });
                    setState(() {
                    if(_becaController.text.length<1)
                    _becaError = "Debe agregar restricción";
                    else
                    _becaError = null; 
                    });},
                    color: Color(0xFFFFCD00),
                    child: Text("Agregar Restricciones",
                    style: TextStyle(fontSize: 17)),
                      ),
                    ]
                   )
                  ]
                )
              ]
            ),
          )
        )
      )
    );
  }
}