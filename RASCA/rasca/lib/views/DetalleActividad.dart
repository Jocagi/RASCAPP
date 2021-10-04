import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Detalle extends StatefulWidget {
  Detalle();
  static const routeName = '/auth';

  @override
  _Detalle createState() => _Detalle();
}
class _Detalle extends State<Detalle> {
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
        home: Scaffold(appBar: AppBar (title: Text('Detalle Actividad'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
          child: Column(
            )
          )
        )
      )
    );
  }
}