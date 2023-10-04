import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';
import 'package:taskiuser/Components/FlushBar.dart';
import 'package:taskiuser/Models/Profile_Model.dart';
import 'package:taskiuser/Screens/Login_Screen.dart';
import 'package:taskiuser/values/values.dart';
import '../Constants.dart';

class ProfileProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  ProfileModel? profile;
  TextEditingController nameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController coNameControler = TextEditingController();
  TextEditingController coEmailControler = TextEditingController();
  TextEditingController updateOtpControler = TextEditingController();
  TextEditingController profilePhonecontroller = TextEditingController();
  bool haveOTP = false;
  bool updateMobileTrue = false;
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
  SignatureController signatureController = SignatureController();
  Uint8List? signature;

  var dropDownListSelectBranchValue;
  var dropDownListSelectBranchID;
  var dropDownListSelectDeptValue;
  var dropDownListSelectDeptID;

  isFourOtp() {
    if (updateOtpControler.text.length == 4) {
      haveOTP = true;
      notifyListeners();
    } else {
      haveOTP = false;
      notifyListeners();
    }
  }

  onchangedBranch(String? data) {
    var value = profile!.branch.firstWhere((value) => value.name == data);
    dropDownListSelectBranchID = value.id;
    print("ID : ${value.id} NAME : ${value.name}");
    dropDownListSelectBranchValue = data!;
    print(dropDownListSelectBranchValue);
    notifyListeners();
  }

  onchangedDept(String? data) {
    var value = profile!.department.firstWhere((value) => value.name == data);
    dropDownListSelectDeptID = value.id;
    print("ID : ${value.id} NAME : ${value.name}");
    dropDownListSelectDeptValue = data;
    print(dropDownListSelectDeptValue);
    notifyListeners();
  }

  selectedBranch(int id) {
    var value = profile!.branch.firstWhere((book) => book.id == id);
    print(value.name);
    return dropDownListSelectBranchValue = value.name;
  }

  selectedDept(int id) {
    var value = profile!.department.firstWhere((book) => book.id == id);
    print(value.name);
    return dropDownListSelectDeptValue = value.name;
  }

  Future exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      exportBackgroundColor: AppColor.white,
      penColor: AppColor.black,
      points: signatureController.points,
    );
    signature = await exportController.toPngBytes();
    return signature;
  }

  Future signatureData(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print(prefs.getString("token"));
    }
    try {
      if (kDebugMode) {
        print(signature);
        print(ApiLinks.baseURL + ApiLinks.profileData);
      }
      final response = await _dio.patch(
        "http://10.114.20.87:2021/login/android/user/v2/profile/signature/update",
        data: FormData.fromMap({
          "signature": MultipartFile.fromBytes(
            signature!,
            filename: "signature.png",
            contentType: MediaType("image", "png"),
          ),
        }),
        options: Options(
          headers: {
            'key': 'bk6GGaMsg0mFtk%2F1irhP30pHYbo%3D%0A',
            'token': prefs.getString("token")
          },
        ),
      );
      if (response.statusCode == 200) {
        CustomFlushBar.customFlushBar(context, "Update", response.toString());
        if (kDebugMode) {
          print(response);
        }
        signatureController.clear();
        getProfileData(context);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode != 200 && e.response?.data != null) {
          CustomFlushBar.customFlushBar(
              context, "Update", e.response!.data.toString());
        }
      }
      rethrow;
    }
    return null;
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
        "http://10.114.20.87:2021/login/android/user/v2/profile",
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
        updateMobileTrue = true;
        notifyListeners();
        Future.delayed(const Duration(seconds: 1));
        CustomFlushBar.customFlushBar(context, "Update", response.toString());
        getProfileData(context);
        if (kDebugMode) {
          print(updateMobileTrue);
        }
        profileUpdateName.clear();
        profileUpdateEmail.clear();
        if (updateOtpControler.text != "") {
          profileUpdateMobile.clear();
          updateOtpControler.clear();
        }
      }
    } catch (e) {
      if (e is DioException) {
        updateMobileTrue = false;
        notifyListeners();
        profileUpdateName.clear();
        profileUpdateEmail.clear();
        if (updateOtpControler.text != "") {
          profileUpdateMobile.clear();
          updateOtpControler.clear();
        }
        if (e.response?.statusCode != 200 && e.response?.data != null) {
          CustomFlushBar.customFlushBar(
              context, "Update", e.response!.data.toString());
        }
      }
      rethrow;
    }
  }

  Future<void> updateCoProfile(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      if (kDebugMode) {
        "http://10.114.20.87:2021/login/android/user/v2/profile/update/corporate/details";
      }
      Map data = {};
      if (employeeIdControler.text != "") {
        data["empcode"] = employeeIdControler.text;
      } else {
        data["empcode"] = profile!.corporate.empcode;
      }
      if (coNameControler.text != "") {
        data["name"] = coNameControler.text;
      } else {
        data["name"] = profile!.corporate.officialname;
      }
      if (coEmailControler.text != "") {
        data["email"] = coEmailControler.text;
      } else {
        data["email"] = profile!.corporate.officialemail;
      }
      if (designationControler.text != "") {
        data["designation"] = designationControler.text;
      } else {
        data["designation"] = profile!.corporate.designation;
      }
      if (dropDownListSelectBranchID != null) {
        data["branch"] = dropDownListSelectBranchID;
      } else {
        data["branch"] = profile?.corporate.branch;
      }
      if (dropDownListSelectDeptID != null) {
        data["department"] = dropDownListSelectDeptID;
      } else {
        data["department"] = profile?.corporate.department;
      }
      if (managerNameControler.text != "") {
        data["reportingmanager"] = managerNameControler.text;
      } else {
        data["reportingmanager"] = profile!.corporate.reportingManager;
      }
      if (managerMobileControler.text != "") {
        data["reportingmanagermobile"] = managerMobileControler.text;
      } else {
        data["reportingmanagermobile"] =
            profile!.corporate.reportingManagerMobile;
      }
      if (managerEmailControler.text != "") {
        data["reportingmanageremail"] = managerEmailControler.text;
      } else {
        data["reportingmanageremail"] =
            profile!.corporate.reportingManagerEmail;
      }
      if (kDebugMode) {
        print(data);
      }
      final response = await _dio.patch(
        "http://10.114.20.87:2021/login/android/user/v2/profile/update/corporate/details",
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
        CustomFlushBar.customFlushBar(context, "Update", response.toString());
        getProfileData(context);
        employeeIdControler.clear();
        coNameControler.clear();
        coEmailControler.clear();
        designationControler.clear();
        managerNameControler.clear();
        managerMobileControler.clear();
        managerEmailControler.clear();
      }
    } catch (e) {
      if (e is DioException) {
        employeeIdControler.clear();
        coNameControler.clear();
        coEmailControler.clear();
        designationControler.clear();
        managerNameControler.clear();
        managerMobileControler.clear();
        managerEmailControler.clear();
        if (e.response?.statusCode != 200 && e.response?.data != null) {
          CustomFlushBar.customFlushBar(
              context, "Update", e.response!.data.toString());
        }
      }
      rethrow;
    }
  }
}
