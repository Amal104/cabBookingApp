import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskiuser/Components/AlertDialog.dart';
import 'package:taskiuser/Components/FlushBar.dart';
import 'package:taskiuser/Components/Toast.dart';
import 'package:taskiuser/Constants.dart';
import 'package:taskiuser/Models/ErrorMessage.dart';
import 'package:taskiuser/Models/SuccessMessage.dart';
import 'package:taskiuser/Screens/Home_Screen.dart';
import 'package:taskiuser/Screens/Profile_Screen.dart';
import 'package:taskiuser/values/values.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Models/VersionCheck_Model.dart';
import '../Screens/Login_Screen.dart';
import '../Screens/Otp_Screen.dart';

class LoginProvider extends ChangeNotifier {
  VersionCheckModel? version;
  final Dio _dio = Dio();

  String device = "";
  String model = "";
  String brand = "";
  int os = 0;

  TextEditingController phonecontroller = TextEditingController();
  String countryCode = "";
  String? currentVersion;
  TextEditingController otpcontroller = TextEditingController();
  var focusNode = FocusNode();
  bool isTenNum = false;
  bool haveOTP = false;
  bool updateAvailbale = false;

  isTenNumber() {
    if (phonecontroller.text.length == 10) {
      isTenNum = true;
      notifyListeners();
    } else {
      isTenNum = false;
      notifyListeners();
    }
  }

  isFourOtp() {
    if (otpcontroller.text.length == 4) {
      haveOTP = true;
      notifyListeners();
    } else {
      haveOTP = false;
      notifyListeners();
    }
  }

  Future<void> fetchVersion(BuildContext context) async {
    try {
      if (kDebugMode) {
        print(ApiLinks.baseURL + ApiLinks.versionCheck);
      }
      final response = await _dio.get(
        ApiLinks.baseURL + ApiLinks.versionCheck,
        options: Options(
          headers: {'key': ApiLinks.key},
        ),
      );
      if (response.statusCode == 200) {
        version = VersionCheckModel.fromJson(response.data);
        notifyListeners();
        checkAppVersion(version!.supportingVersion, context);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> genarateOTP(BuildContext context) async {
    try {
      if (kDebugMode) {
        print(ApiLinks.baseURL + ApiLinks.otpGenarate);
      }
      final response = await _dio.post(
        "${ApiLinks.baseURL}${ApiLinks.otpGenarate}",
        data: {
          'mobile': phonecontroller.text,
          'code': countryCode,
        },
        options: Options(
          headers: {'key': ApiLinks.key},
        ),
      );
      if (response.statusCode == 200) {
        print(response);
        if (kDebugMode) {
          print(countryCode + phonecontroller.text);
        }
        Get.off(
          () => const OtpScreen(),
          transition: Transition.rightToLeft,
        );
        Future.delayed(const Duration(seconds: 3));
        CustomFlushBar.customFlushBar(context, "OTP", response.toString());
      } else {
        if (kDebugMode) {
          print(response);
        }
        CustomFlushBar.customFlushBar(context, "Error", response.toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> otpVerification(BuildContext context) async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      os = 1;
      device = androidInfo.product;
      model = androidInfo.model;
      brand = androidInfo.brand;
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      os = 2;
      device = iosInfo.name;
      model = iosInfo.model;
      brand = iosInfo.systemName;
    }
    if (kDebugMode) {
      print(device);
      print(model);
      print(brand);
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;
    String otp = otpcontroller.text;
    print(phonecontroller.text);
    print(countryCode);
    try {
      final response = await _dio.post(
        "${ApiLinks.baseURL}${ApiLinks.otpVerification}",
        data: {
          'mobile': phonecontroller.text,
          'code': countryCode,
          "otp": otp,
          "device": {
            "os": os,
            "model": model,
            "device": device,
            "brand": brand,
          }
        },
        options: Options(
          headers: {
            'key': ApiLinks.key,
            'version': currentVersion
          },
        ),
      );
      if (response.statusCode == 200) {
        final res = response.data;
        final data = SuccessMessage.fromJson(response.data);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", res["user"]);
        if (kDebugMode) {
          print(response);
        }
        if (data.isExist == true) {
          Get.off(
            () => const HomePage(),
            transition: Transition.rightToLeft,
          );
          Future.delayed(const Duration(seconds: 3));
          CustomFlushBar.customFlushBar(context, "Login", "Successful!!");
        } else {
          Get.off(
            () => const ProfileScreen(),
            transition: Transition.rightToLeft,
          );
          Future.delayed(const Duration(seconds: 3));
          CustomFlushBar.customFlushBar(context, "Login", "Successful!!");
        }
      } else {
        if (kDebugMode) {
          print(response);
        }
        CustomFlushBar.customFlushBar(context, "Error", response.toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    phonecontroller.clear();
    otpcontroller.clear();
    Get.off(
      () => const LoginScreen(),
      transition: Transition.rightToLeft,
    );
  }

  Future<void> checkAppVersion(
      int supportingVersion, BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion = packageInfo.version;
    if (kDebugMode) {
      print(currentVersion);
    }
    if (currentVersion!.compareTo("111") < 0) {
      if (kDebugMode) {
        print(supportingVersion);
        print("redirecting to playstore......");
        updateAvailbale = true;
        notifyListeners();
        print(updateAvailbale);
      }
      CustomAlertDialog.showCustomDialog(
        context,
        "An app update is available",
        "Do you want to continue?",
        () async {
          await canLaunchUrlString(appPlaystoreLink)
              ? await launchUrlString(
                  appPlaystoreLink,
                )
              : showCustomToast(context, "Something went wrong!");
          Navigator.of(context).pop();
        },
      );
    } else {
      if (kDebugMode) {
        print("App is Upto date!");
      }
    }
  }
}
