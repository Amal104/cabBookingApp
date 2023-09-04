import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskiuser/Components/FlushBar.dart';
import 'package:taskiuser/Models/Profile_Model.dart';
import 'package:taskiuser/Screens/Login_Screen.dart';

import '../Constants.dart';

class ProfileProvider extends ChangeNotifier {
  Dio _dio = Dio();
  ProfileModel? profile;
  TextEditingController nameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController updateOtpControler = TextEditingController();
  TextEditingController profilePhonecontroller = TextEditingController();
  bool haveOTP = false;
  var focusNode = FocusNode();
  String profileUpdateCountryCode = "";
  TextEditingController employeeIdControler = TextEditingController();
  TextEditingController designationControler = TextEditingController();
  TextEditingController managerNameControler = TextEditingController();
  TextEditingController managerMobileControler = TextEditingController();
  TextEditingController managerEmailControler = TextEditingController();
  TextEditingController profileUpdateName = TextEditingController();
  TextEditingController profileUpdateEmail = TextEditingController();
  TextEditingController profileUpdateMobile = TextEditingController();

  var dropDownListSelectBranchValue;
  var dropDownListSelectDeptValue;

  onchangedBranch(String? value) {
    dropDownListSelectBranchValue = value!;
    print(dropDownListSelectBranchValue);
    notifyListeners();
  }

  isFourOtp() {
    if (updateOtpControler.text.length == 4) {
      haveOTP = true;
      notifyListeners();
    } else {
      haveOTP = false;
      notifyListeners();
    }
  }

  onchangedDept(String? value) {
    dropDownListSelectDeptValue = value!;
    print(dropDownListSelectDeptValue);
    notifyListeners();
  }

  Future<ProfileModel?> getProfileData(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print(prefs.getString("token"));
    }
    try {
      if (kDebugMode) {
        print(ApiLinks.baseURL + ApiLinks.profileData);
      }
      final response = await _dio.get(
        ApiLinks.baseURL + ApiLinks.profileData,
        options: Options(
          headers: {
            'key': 'bk6GGaMsg0mFtk%2F1irhP30pHYbo%3D%0A',
            'token': prefs.getString("token")
          },
        ),
      );
      if (response.statusCode == 200) {
        profile = ProfileModel.fromJson(response.data);
        notifyListeners();
        if (kDebugMode) {
          print(response);
        }
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          prefs.remove("token");
          Get.off(() => const LoginScreen());
          Future.delayed(const Duration(seconds: 1));
          CustomFlushBar.customFlushBar(
              context, "Login", "Expired please try again!");
        }
      }
      rethrow;
    }
    return null;
  }

  Future<void> updateProfile(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      if (kDebugMode) {
        print(ApiLinks.baseURL + ApiLinks.profileUpdate);
      }
      Map data = {};
      if (profileUpdateName.text != "") {
        data["name"] = profileUpdateName.text;
      }
      if (profileUpdateMobile.text != "") {
        data["mobile"] = profileUpdateMobile.text;
      }
      if (profileUpdateEmail.text != "") {
        data["email"] = profileUpdateEmail.text;
      }
      if (updateOtpControler.text != "") {
        data["otp"] = updateOtpControler.text;
        data["mobile"] = profileUpdateMobile.text;
      }
      if (kDebugMode) {
        print(data);
      }
      final response = await _dio.patch(
        ApiLinks.baseURL + ApiLinks.profileUpdate,
        data: data,
        options: Options(
          headers: {'key': ApiLinks.key, 'token': token},
        ),
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response);
        }
        Future.delayed(const Duration(seconds: 1));
        if(context.mounted) return;
        CustomFlushBar.customFlushBar(context, "Update", response.toString());
        getProfileData(context);
        profileUpdateName.clear();
        profileUpdateEmail.clear();
        if (updateOtpControler.text != "") {
          profileUpdateMobile.clear();
          updateOtpControler.clear();
        }
      }
    } catch (e) {
      profileUpdateName.clear();
      profileUpdateEmail.clear();
      if (updateOtpControler.text != "") {
        profileUpdateMobile.clear();
        updateOtpControler.clear();
      }
      if (e is DioException) {
        CustomFlushBar.customFlushBar(context, "Error", e.response.toString());
      }
      dispose();
      rethrow;
    }
  }
}
