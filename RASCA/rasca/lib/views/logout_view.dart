import 'package:flutter/material.dart';
import 'package:rasca/views/loginV2_view.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Texto de confirmación
    final confirmationText = Text(
      '¿Está seguro que desea cerrar sesión?',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 30.0,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.bold,
      ),
    );

    //Botón de cerrar sesión
    final logoutButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFFCD00),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: Text(
        'Confirmar',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20.0,
          color: Color(0xFF00205B),
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        // Navigate to second route when tapped.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
    );

    //Botón de cancelar
    final cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: Text(
        'Cancelar',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20.0,
          color: Color(0xFF00205B),
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        // Regresar a pantalla anterior
        Navigator.pop(
          context,
        );
      },
    );

    //Escribir en pantalla
    return Scaffold(
      appBar: AppBar(
        title: Text('Cerrar Sesión'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            confirmationText,
            SizedBox(height: 25.0),
            logoutButton,
            SizedBox(height: 25.0),
            cancelButton,
          ],
        ),
      ),
    );
  }
}
