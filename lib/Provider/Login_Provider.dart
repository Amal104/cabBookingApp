import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskiuser/Constants.dart';
import 'package:taskiuser/Models/ErrorMessage.dart';
import 'package:taskiuser/Models/SuccessMessage.dart';
import 'package:taskiuser/Screens/Home_Screen.dart';
import 'package:taskiuser/Screens/Profile_Screen.dart';
import '../Models/VersionCheck_Model.dart';
import '../Screens/Login_Screen.dart';
import '../Screens/Otp_Screen.dart';

class LoginProvider extends ChangeNotifier {
  VersionCheckModel? version;
  final Dio _dio = Dio();

  TextEditingController phonecontroller = TextEditingController();
  String countryCode = "";
  TextEditingController otpcontroller1 = TextEditingController();
  TextEditingController otpcontroller2 = TextEditingController();
  TextEditingController otpcontroller3 = TextEditingController();
  TextEditingController otpcontroller4 = TextEditingController();

  Future<void> fetchVersion() async {
    try {
      final response = await _dio.post(
        ApiLinks.baseURL + ApiLinks.versionCheck,
        options: Options(
          headers: {'key': 'bk6GGaMsg0mFtk%2F1irhP30pHYbo%3D%0A'},
        ),
      );
      if (response.statusCode == 200) {
        version = VersionCheckModel.fromJson(response.data);
        notifyListeners();
        checkAppVersion(version!.supportingVersion);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> genarateOTP() async {
    try {
      final response = await _dio.post(
        ApiLinks.baseURL + ApiLinks.otpGenarate,
        data: {
          'mobile': phonecontroller.text,
          'code': countryCode,
        },
        options: Options(
          headers: {'key': 'bk6GGaMsg0mFtk%2F1irhP30pHYbo%3D%0A'},
        ),
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(countryCode + phonecontroller.text);
        }
        if (kDebugMode) {
          print(response.statusMessage);
        }
        Get.off(
          () => const OtpScreen(),
          transition: Transition.rightToLeft,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> otpVerification() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;
    String otp = otpcontroller1.text +
        otpcontroller2.text +
        otpcontroller3.text +
        otpcontroller4.text;
    try {
      final response = await _dio.post(
        ApiLinks.baseURL + ApiLinks.otpVerification,
        data: {
          'mobile': phonecontroller.text,
          'code': countryCode,
          "otp": otp,
          "device": {}
        },
        options: Options(
          headers: {
            'key': 'bk6GGaMsg0mFtk%2F1irhP30pHYbo%3D%0A',
            'version': currentVersion
          },
        ),
      );
      if (response.statusCode == 200) {
        final data = SuccessMessage.fromJson(response.data);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userkey", data.user);
        if (kDebugMode) {
          print(data.response);
        }
        if (data.isExist == true) {
          Get.off(
            () => const HomePage(),
            transition: Transition.rightToLeft,
          );
        } else {
          Get.off(
            () => const ProfileScreen(),
            transition: Transition.rightToLeft,
          );
        }
      } else {
        final error = ErrorMessage.fromJson(response.data);
        if (kDebugMode) {
          print(error.message);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userkey");
    Get.off(
      () => const LoginScreen(),
      transition: Transition.rightToLeft,
    );
  }

  Future<void> checkAppVersion(int supportingVersion) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;

    if (currentVersion.compareTo(supportingVersion.toString()) < 0) {
      print("redirecting to playstore......");
    } else {
      print("App is Uptodate!");
    }
  }
}
