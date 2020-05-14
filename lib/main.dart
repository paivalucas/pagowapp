import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/Views/auth/login.dart';
import 'package:pagowandroidmobile/Views/feed/NavigationBar.dart';


// TODO: 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PagowApp',
      home: App(),
    );
  }
}