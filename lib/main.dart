import 'package:flutter/material.dart';
//import 'package:flutter_kaypi/pages/Routes/routesPage.dart';
import 'package:flutter_kaypi/zoom_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaypi',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        dividerColor: Colors.transparent,
      ),
      home: MenuZoom(),
      debugShowCheckedModeBanner: false,
    );
  }
}
