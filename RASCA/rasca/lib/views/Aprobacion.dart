import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Aprobacion extends StatefulWidget {
  Aprobacion();
  static const routeName = '/auth';

  @override
  _Aprobacion createState() => _Aprobacion();
}
class _Aprobacion extends State<Aprobacion> {
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
        home: Scaffold(appBar: AppBar (title: Text('Aprobar Actividad'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(alignment: Alignment.center,
                    child: Text('Nombre Actividad',
                    style: TextStyle(color: Colors.white, fontSize: 20,
                    fontWeight: FontWeight.bold,)),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        ), 
                      ),
            Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text('Fecha Inicio',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                    child: Text('Fecha a finalizar',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                    ],
                  )//row
                  ),
                Container(
                    child: Text('Cupos disponibles',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                  Container(
                  child: Text('Restricciones',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                  ),
                  Container(
                    child: Text('Horas a acreditar',
                    style: TextStyle(color: Colors.black)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFE6E6FA),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                    Container(alignment: Alignment.center,
                    child: Text('Descripción',
                    style: TextStyle(color: Colors.white, fontSize: 20,
                    fontWeight: FontWeight.bold,)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(color: Color(0xFF00205B),
                    borderRadius: BorderRadius.vertical(), 
                        )
                      ),
                    Container(
                    child: Text('Descripción de la actividad bla bla',
                    style: TextStyle(color: Colors.black, fontSize: 15)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.all(5)
                        ),
                  Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                RaisedButton(onPressed: (){
                    Aprobadas(context);
                    },
                    color: Color(0xFFFFCD00),
                    child: Text("Aprobar",
                    style: TextStyle(fontSize: 17)),
                      ),
                RaisedButton(onPressed: (){
                    Denegadas(context);
                    },
                    color: Color(0xFFFFCD00),
                    child: Text("Denegar",
                    style: TextStyle(fontSize: 17)),
                      )
                    ],
                  )
                  )//row
                ]
            )
          )
        )
      )
    );
  }
}
void Aprobadas(BuildContext context){
  var alertDialog = AlertDialog(
    title: Text("Actualización"),
    content: Text("Actividad aprobada exitosamente"),
  );

  showDialog(
    context: context, 
    builder: (BuildContext context){
      return alertDialog;
    });
}
void Denegadas(BuildContext context){
  var alertDialog = AlertDialog(
    title: Text("Actualización"),
    content: Text("Actividad denegada"),
  );

  showDialog(
    context: context, 
    builder: (BuildContext context){
      return alertDialog;
    });
}