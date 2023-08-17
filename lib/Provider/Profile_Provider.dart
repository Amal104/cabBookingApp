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
  ProfileModel? profile;
  TextEditingController nameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController employeeIdControler = TextEditingController();
  TextEditingController designationControler = TextEditingController();
  TextEditingController managerNameControler = TextEditingController();
  TextEditingController managerMobileControler = TextEditingController();
  TextEditingController managerEmailControler = TextEditingController();

  var dropDownListSelectBranchValue;
  var dropDownListSelectDeptValue;

  onchangedBranch(String? value) {
    dropDownListSelectBranchValue = value!;
    print(dropDownListSelectBranchValue);
    notifyListeners();
  }

  onchangedDept(String? value) {
    dropDownListSelectDeptValue = value!;
    print(dropDownListSelectDeptValue);
    notifyListeners();
  }

  Future<ProfileModel?> getProfileData(BuildContext context) async {
    Dio _dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("token"));
    try {
      final response = await _dio.get(
        "http://192.168.29.9:2021/login/android/user/v2/profile",
        options: Options(
          headers: {
            'key': 'bk6GGaMsg0mFtk%2F1irhP30pHYbo%3D%0A',
            'token': prefs.getString("token")
          },
        ),
      );
      if (response.statusCode == 200) {
        profile = ProfileModel.fromJson(response.data);
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
}
