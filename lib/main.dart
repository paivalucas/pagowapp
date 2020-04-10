import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/screens/auth/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: MyHomePage(title: 'Pagina Inicial'),
    );
  }
}