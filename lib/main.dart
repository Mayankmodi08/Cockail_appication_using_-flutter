import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cocktail App",
        theme: ThemeData(primarySwatch: Colors.orange),
        home: HomePage());
  }
}
