import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:rasca/views/Aprobacion.dart';
import 'package:rasca/views/loginV2_view.dart';
import 'package:rasca/views/transitionsRoutes_view.dart';
import 'package:rasca/views/CrearActividad.dart';
import 'package:rasca/views/UsuarioPerfil.dart';
import 'package:rasca/views/Restricciones.dart';
import 'package:rasca/views/DetalleActividad.dart';
import 'package:rasca/views/Aprobacion.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crear Actividad',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFF00205B),
        primaryColor: Colors.blue,
        accentColor: Colors.yellow,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            ),
          button: TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
            //color: Color(0xff01A0C7)
            //color: Colors.yellow
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.blue[900],
          ),
          headline1: TextStyle(fontFamily: 'Quicksand'),
          headline2: TextStyle(fontFamily: 'Quicksand'),
          headline4: TextStyle(fontFamily: 'Quicksand'),
          headline5: TextStyle(fontFamily: 'NotoSans'),
          headline6: TextStyle(fontFamily: 'NotoSans'),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
          subtitle2: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: Aprobacion.routeName,
      routes: {
        Aprobacion.routeName: (context) => Aprobacion(),
      },
    );
  }
}
