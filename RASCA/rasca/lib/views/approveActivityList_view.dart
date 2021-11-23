import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rasca/models/activity_model.dart';
import 'package:rasca/widgets/sideBar.dart';
import '../data.dart';

class ListaActividadesPendientes extends StatefulWidget {
  ListaActividadesPendientes({Key? key}) : super(key: key);

  @override
  _ListaActividadesPendientes createState() => _ListaActividadesPendientes();
}

class _ListaActividadesPendientes extends State<ListaActividadesPendientes> {
  List<ListItem> activityItems = [];

  //Parse to JSON
  List<Activity> activityFromJson(String str) =>
      List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));
  String activityToJson(List<Activity> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  //ListItems
  List<ListItem> getListItems(List<Activity> activities) {
    return List<ListItem>.generate(
      activities.length,
      (i) => MessageItem(activities[i].nombre!, activities[i].descripcion!),
    );
  }

  //Llama a la API para obtener actividades
  Future<List<ListItem>> activitiesAPI(String token) async {
    List<ListItem> items = [];
    //Información de la versión actual de la app
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String code = packageInfo.buildNumber;
    String agent = "RASCAPP/" + version + "|" + code;

    //Enviar solicitud al servidor
    final response = await http.get(
      Uri.parse(
          'https://bruteforceurl.herokuapp.com/api/actividades/getPending'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'User-Agent': agent,
        'Authorization': 'Bearer ' + token,
      },
    );
    try {
      if (response.statusCode == 200) {
        // Respuesta exitosa
        if (response.body.isNotEmpty) {
          final activities = activityFromJson(response.body);
          items = getListItems(activities);
        }
      }
    } catch (err) {}

    //Set ListView items
    return items;
  }

  /*
  @override
  void initState() {
    activitiesAPI(Data.token);
    super.initState();
  }
  */

  @override
  Widget build(BuildContext context) {
    final title = 'Lista de actividades';

    return MaterialApp(
      title: title,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Color(0xFF00205B),
      )),
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder<List<ListItem>>(
          future: activitiesAPI(Data.token),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              activityItems = snapshot.data!;
              return ListView.builder(
                // Deja que ListView sepa cuántos elementos necesita para construir
                itemCount: activityItems.length,
                itemBuilder: (context, index) {
                  final item = activityItems[index];
                  if (item is HeadingItem) {
                    return ListTile(
                      title: Text(
                        item.heading,
                        style: Theme.of(context).textTheme.headline,
                      ),
                    );
                  } else if (item is MessageItem) {
                    return ListTile(
                      title: Text(item.sender),
                      subtitle: Text(item.body),
                    );
                  }
                  //default
                  return ListTile(
                    title: Text("null"),
                    subtitle: Text("null"),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Container();
            }
            return Center(
              child: Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}

// La clase base para los diferentes tipos de elementos que la Lista puede contener
abstract class ListItem {}

// Un ListItem que contiene datos para mostrar un encabezado
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// Un ListItem que contiene datos para mostrar un mensaje
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
