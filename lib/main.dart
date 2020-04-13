import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/screens/app/feed/feed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      home: App(),
    );
  }
}