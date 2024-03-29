import 'package:flutter/material.dart';
import 'home.dart';
import 'splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new Home()
      },
    );
  }
}
