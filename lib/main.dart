import 'package:flutter/material.dart';
import 'package:flutter_1/layout/todo_main_screen.dart';
// import 'package:flutter_1/modules/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoMainScreen(),
    );
  }
}
