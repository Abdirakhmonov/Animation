import 'package:flutter/material.dart';
import 'package:lesson_62/views/screens/external_animation.dart';
import 'package:lesson_62/views/screens/home_screen.dart';
import 'package:lesson_62/views/screens/homework.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homework()
    );
  }
}
