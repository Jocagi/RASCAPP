import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rasca/views/Restricciones.dart';

class Actividad extends StatefulWidget {
  Actividad();
  static const routeName = '/auth';

  @override
  _Actividad createState() => _Actividad();
}
class _Actividad extends State<Actividad> {
  //Variables Globales
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _CuposController = TextEditingController();
  TextEditingController _DescController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var _formKeyCupos = GlobalKey<FormState>();
  var _formKeyDesc = GlobalKey<FormState>();
  String ? _nombreError;
  String ? _cuposError;
  String ? _DescError;
  late DateTime startDate;
  late DateTime endDate;
  String ? Horas;
  int index = 0;

  //Lista Cupertino
  final items =[
    '1', '2', '3', '4', '5', '6', '7', '8',
  ];
  //Custom text style to apply to UI elements
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    color: Colors.black,
  );
  @override
  void initState(){
    super.initState();
    startDate = DateTime.now();
    endDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
       title: 'Flutter Demo',
  theme: ThemeData(
       appBarTheme: AppBarTheme(
     color: Color(0xFF00205B),
     )
          ),
        home: Scaffold(appBar: AppBar (title: Text('Crear Actividad'),
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
                  controller: _nombreController,
                  decoration: InputDecoration(
                  hintText: "Actividad",
                  labelText: "Nombre Actividad",
                  errorText: _nombreError,
                  labelStyle: TextStyle(fontSize: 20, 
                  color: Colors.black),
                  border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[                
                  ListTile(
                  title: Text("Fecha de Inicio: ${startDate.year},${startDate.month},${startDate.day}",
                  style: TextStyle(fontSize: 20),),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: _startDate,
                    ),
                  ListTile(
                  title: Text("Fecha a finalizar: ${endDate.year},${endDate.month},${endDate.day}",
                  style: TextStyle(fontSize: 20),),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  onTap: _endDate,
                    ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text("Horas a Acreditar",
                    style: TextStyle(
                      fontSize: 30,
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Center(
                      child: CupertinoPicker(
                        itemExtent: 50,
                        children: items
                        .map((item) => Center(child: Text(item)
                        ))
                        .toList(),
                        onSelectedItemChanged: (index){
                          setState(() => this.index = index
                          );
                        },
                      ),),
                    ),
                  SizedBox(height: 20,),
                  Form(
                  key: _formKeyCupos,
                  child: TextFormField(
                  controller: _CuposController,
                  decoration: InputDecoration(
                  hintText: "Cupos",
                  labelText: "Cupos Disponibles",
                  errorText: _cuposError,
                  labelStyle: TextStyle(fontSize: 20, 
                  color: Colors.black),
                  border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: 20,),
                  Form(
                  key: _formKeyDesc,
                  child: TextFormField(
                  controller: _DescController,
                  decoration: InputDecoration(
                  hintText: "Descripción",
                  labelText: "Descripción",
                  errorText: _DescError,
                  labelStyle: TextStyle(fontSize: 20, 
                  color: Colors.black),
                  border: OutlineInputBorder()),
                  ),
                ),
                RaisedButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Restricciones() ),);     
                     },
                    color: Color(0xFFFFCD00),
                    child: Text("Agregar Restricciones",
                    style: TextStyle(fontSize: 17)),
                      ),
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                RaisedButton(onPressed: (){},
                  color: Colors.grey,
                  child: Text("Cancelar",
                  style: TextStyle(fontSize: 17)),),
                  RaisedButton(onPressed: (){
                    print("Nombre: "+_nombreController.text);
                    print("Fechas: "+startDate.toString()+" "+endDate.toString());
                    print(items[index].toString());
                    print("Cupos: "+_CuposController.text);
                    setState(() {
                    if(_nombreController.text.length<1)
                    _nombreError = "Debe agregar un nombre a la actividad";
                    else
                    _nombreError = null; 
                    });
                    setState(() {
                    if(_CuposController.text.length<1)
                    _cuposError = "Debe agregar al menos 1 cupo a la actividad";
                    else
                    _cuposError = null; 
                    });
                    setState(() {
                    if(_DescController.text.length<1)
                    _DescError = "Debe agregar una descripción";
                    else
                    _DescError = null; 
                    });},
                    color: Color(0xFFFFCD00),
                    child: Text("Publicar",
                    style: TextStyle(fontSize: 17)),
                      ),
                    ]
                   )
                  ]
                )
              ]
            ),
          )
        ),
      )
    );
  }
  _startDate() async{
    DateTime? date = await showDatePicker(
      context: context, 
      initialDate: startDate, 
      firstDate: DateTime(DateTime.now().year-5), 
      lastDate: DateTime(DateTime.now().year+5)
      );
      if (date != null)
      setState(() {
        startDate = date;
      });
  }
    _endDate() async{
    DateTime? date = await showDatePicker(
      context: context, 
      initialDate: endDate, 
      firstDate: DateTime(DateTime.now().year-5), 
      lastDate: DateTime(DateTime.now().year+5)
      );
      if (date != null)
      setState(() {
        endDate = date;
      });
  }
}