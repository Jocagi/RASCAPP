import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PerfilUsuario extends StatefulWidget {
  PerfilUsuario();
  static const routeName = '/auth';

  @override
  _PerfilUsuario createState() => _PerfilUsuario();
}
class _PerfilUsuario extends State<PerfilUsuario> {
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
        home: Scaffold(appBar: AppBar (title: Text('Perfil de Usuario'),
        ),
        body: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
            child: Text('Mi Perfil',
            style: TextStyle(color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold)),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.vertical(),
            border: Border.all(color: Colors.black, width: 4) )
                )
              ]
            )
          ),
              Container(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Container(
            child: Image.asset('assets/images/Castor.PNG', width: 100,),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white10,
            border: Border.all(color: Colors.black, width: 4),
            borderRadius: BorderRadius.circular(20), 
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                  child: Text('Horas Registradas: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                  ),
                  Container(
                    child: Text('Horas Faltantes ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      )
                    ],
                  ),
                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Container(
                    child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                    Container(
                      child: Text('Var',
                      style: TextStyle(color: Colors.black)),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                      borderRadius: BorderRadius.vertical(), 
                          )
                        ),
                    ]
                  )
                ]
              )
            ),
          Container(
            child: Padding(padding: const EdgeInsets.all(12),
            child: RaisedButton.icon(onPressed: (){}, 
            icon: Icon(Icons.edit), 
            label: Text('Cambiar\ncontraseña',
            style: TextStyle(fontSize: 17),),
            color: Color(0xFFFFCD00),
                ),
                )
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Container( child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text('Nombre: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Carné: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Correo: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                  child: Text('Fecha de Nac: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                  ),
                  Container(
                    child: Text('Correo: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Inicio de beca: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Fin de beca: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Tipo de Beca: ',
                    style: TextStyle(color: Colors.white)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                    ],
                  )
              ),
              Container(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                  child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                  ),
                  Container(
                    child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Var',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                    ],
                  ))
                ]
              )
            ]
          ),
        )
      )
    );
  }
}