import 'package:flutter/material.dart';
import 'package:rasca/views/CrearActividad.dart';
import 'package:rasca/views/UsuarioPerfil.dart';
import 'package:rasca/views/dashboard_view.dart';
import 'package:rasca/views/loginV2_view.dart' as login;
import 'package:rasca/views/login_view.dart';
import 'package:rasca/views/logout_view.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menú',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Mis actividades'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()))
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Actividades'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Perfil'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PerfilUsuario()))
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Crear actividad'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Actividad()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogoutScreen()))
            },
          ),
        ],
      ),
    );
  }
}
