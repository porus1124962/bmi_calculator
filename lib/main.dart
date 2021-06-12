import 'package:flutter/material.dart';
import 'package:bmi_calculator/Pages/home_page.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: HexColor('#1a1e45'),
          accentColor: HexColor('#090b2b')),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
          brightness: Brightness.dark),

      routes: {
        "/":(context) => HomePage(),
      },
    );
  }
}
