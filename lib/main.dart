import 'package:flutter/material.dart';
import 'package:flutter_bmi/components/navbar.dart';
import 'package:flutter_bmi/contents/input_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0d22),
      ),
      home: const Scaffold(
        appBar: Nav_Bar(
          labeltext: 'BMI',
        ),
        body: InputScreen(),
      ),
    );
  }
}
