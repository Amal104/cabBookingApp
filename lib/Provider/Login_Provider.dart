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

  String? device;
  String? model;
  String? brand;

  TextEditingController phonecontroller = TextEditingController();
  String countryCode = "";
  String? currentVersion;
  TextEditingController otpcontroller1 = TextEditingController();
  TextEditingController otpcontroller2 = TextEditingController();
  TextEditingController otpcontroller3 = TextEditingController();
  TextEditingController otpcontroller4 = TextEditingController();
  bool isTenNum = false;
  bool isOTP1 = false;
  bool isOTP2 = false;
  bool isOTP3 = false;
  bool isOTP4 = false;
  bool haveOTP = false;

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
    if (otpcontroller1.text.isNotEmpty) {
      isOTP1 = true;
      notifyListeners();
    }
    if (otpcontroller2.text.isNotEmpty) {
      isOTP2 = true;
      notifyListeners();
    }
    if (otpcontroller3.text.isNotEmpty) {
      isOTP3 = true;
      notifyListeners();
    }
    if (otpcontroller4.text.isNotEmpty) {
      isOTP4 = true;
      haveOTP = true;
      notifyListeners();
    } else {
      isOTP1 = false;
      isOTP2 = true;
      isOTP3 = true;
      isOTP4 = true;
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
          headers: {'key': 'bk6GGaMsg0mFtk%2F1irhP30pHYbo%3D%0A'},
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
        "http://192.168.29.108:2021/" + ApiLinks.otpGenarate,
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
      } else {
        var status = response.statusMessage;
        CustomFlushBar.customFlushBar(context, "Error", status!);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> otpVerification() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.device;
      model = androidInfo.model;
      brand = androidInfo.brand;
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.name;
      model = iosInfo.model;
      brand = iosInfo.systemName;
    }

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
          "device": {
            brand,
            device,
            model,
          }
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
