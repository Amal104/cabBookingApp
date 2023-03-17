import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskiuser/Screens/Login_Screen.dart';
import 'Screens/Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'taSki User',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor:  const Color(0xFF141414),
      ),
      home: const HomePage(),
    );
  }
}
