import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskiuser/Screens/Login_Screen.dart';

import 'Home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    tokencheck();
  }

  tokencheck() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("userkey");
      if (token != null) {
        Timer(const Duration(seconds: 4), (() {
          Get.off(
            () => const HomePage(),
            transition: Transition.upToDown,
          );
        }));
      }else{
        Timer(const Duration(seconds: 4), (() {
          Get.off(
            () => const LoginScreen(),
            transition: Transition.upToDown,
          );
        }));
      }
    }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(),
    );
  }
}