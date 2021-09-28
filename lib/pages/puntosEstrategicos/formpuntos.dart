import 'package:flutter/material.dart';
import 'package:flutter_kaypi/provider/puntosEstrategicos_provider.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class FormPuntos extends StatefulWidget {
  const FormPuntos({Key? key}) : super(key: key);

  @override
  _FormPuntosState createState() => _FormPuntosState();
}

class _FormPuntosState extends State<FormPuntos> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: InkWell(
      onTap: () => ZoomDrawer.of(context)!.toggle(),
      child: Icon(Icons.menu, color: Colors.grey[600], size: 28,),),),
      body: _lista(),
    );   
  }

  Widget _lista() {
    return FutureBuilder(

      future: puntosEstrategicosProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {

        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }
 
        if (!snapshot.hasData) {
          return Center(child: Text('No hay data'));
        }

        return ListView(
          children: _listaItems(snapshot.data, context),
          );
      },

    );
  }
  List<Widget>_listaItems(List<dynamic>? data, BuildContext context) {

    final List<Widget> opciones = [];

    data?.forEach((opt) { 
      final widgetTemp = ListTile(
            title: Text(opt['Nombre'], 
                    style: TextStyle(
                      fontSize: 18.0, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(64, 85, 157, 1.0)
                    ),
                  ),
            subtitle: Text(opt['Categoria']),
            leading: Image.asset("assets/img/KaypiLogo.png"),       
            //Agregar contenido al seleccionar el boton     
            onTap: () {},   

            );
            opciones..add(widgetTemp)
                    ..add(Divider());
    });
    return opciones;
  }
}