import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rasca/views/UsuarioPerfil.dart';
import 'package:rasca/controllers/login_controller.dart';
import 'package:rasca/views/logout_view.dart';
import 'package:http/http.dart' as http;
import 'package:rasca/Clases/login.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();
  static const routeName = '/auth';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userController.dispose();
    pswController.dispose();
    super.dispose();
  }

  final userController = TextEditingController();
  final pswController = TextEditingController();
  Future<String> loginAPI(String usuario, String contrasenia) async {
    final response = await http.post(
      Uri.parse('https://bruteforceurl.herokuapp.com/api/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"Correo": usuario, "Contrasena": contrasenia}),
    );
    try {
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        if (response.body.contains("token")) {
          List<Text> retr = response.body
              .split('"') // split the text into an array
              .map((String text) => Text(text)) // put the text inside a widget
              .toList();
          return retr[3].data.toString();
        } else {
          return "Error";
        }
      } else {
        return "Error";
      }
    } catch (err) {
      return "Error";
    }
  }

  bool ishidePassword = true;
  //Custom text style to apply to UI elements
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final userField = TextField(
        //CONTROLADOR PARA OBTENER EL TEXTO
        controller: userController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(32.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFCD00), width: 2.0),
              borderRadius: BorderRadius.circular(32.0)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Usuario",
          hintStyle: new TextStyle(color: Colors.grey),
        ));

    final passwordField = TextField(
      //CONTROLADOR PARA OBTENER EL TEXTO
      controller: pswController,
      obscureText: ishidePassword,
      style: style,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(32.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFCD00), width: 2.0),
            borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Contraseña",
        suffixIcon: InkWell(
          onTap: _togglePasswordView,
          child: Icon(Icons.visibility),
        ),
        hintStyle: new TextStyle(color: Colors.grey),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xFFFFCD00),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          setState(() async {
            //LOGIN
            //USUARIO Y CONTRASEÑA
            if (userController.text == '') {
              _showMyDialog(Text('Usuario no ingresado'));
            } else if (pswController.text == '') {
              _showMyDialog(Text('Contraseña no ingresada'));
            } else {
              String hola =
                  await loginAPI(userController.text, pswController.text);
              if (hola != "Error") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilUsuario()),
                );
              } else {
                _showMyDialog(Text(
                    'Su usuario o contraseña es inválido. Consulte con el departamento de becas para recuperar su contraseña.'));
              }
            }
          });
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Color(0xFF00205B),
                fontWeight: FontWeight.bold,
                backgroundColor: Color(0xFFFFCD00))),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF00205B),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 125.0,
                  child: Image.asset(
                    "assets/images/LogoURL.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                userField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      ishidePassword = !ishidePassword;
    });
  }

  Future<void> _showMyDialog(Text msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sesión denegada'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[msg],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
