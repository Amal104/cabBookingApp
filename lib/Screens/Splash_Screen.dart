import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskiuser/Screens/Login_Screen.dart';
import 'package:taskiuser/values/values.dart';

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
    } else {
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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height(context) * 0.12,
          ),
          Align(
            child: Image.asset(
              "assets/images/TaskiLogoWhite.png",
              height: height(context) * 0.06,
            ),
          ),
          SizedBox(
            height: height(context) * 0.5,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "book your",
                    style: GoogleFonts.inter(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    "taSki",
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
