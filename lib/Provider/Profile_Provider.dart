import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  TextEditingController nameControler = TextEditingController(text: "Amal K A");
  TextEditingController emailControler = TextEditingController(text: "amalka@taski.in");
  TextEditingController employeeIdControler = TextEditingController(text: "taski172");
  TextEditingController designationControler = TextEditingController(text: "Flutter Developer");
  TextEditingController managerNameControler = TextEditingController(text: "Dev Akash");
  TextEditingController managerMobileControler = TextEditingController(text: "9747451474");
  TextEditingController managerEmailControler = TextEditingController(text: "akash@taski.in");

  List<String> dropDownListSelectBranch = [
    "Select Branch",
    "Kochi",
    "Bangalore"
  ];
  List<String> dropDownListSelectDept = [
    "Select Department",
    "Test",
    "Develop"
  ];

  String dropDownListSelectBranchValue = "Select Branch";
  String dropDownListSelectDeptValue = "Select Department";

  onchangedBranch(String? value) {
    dropDownListSelectBranchValue = value!;
    notifyListeners();
  }

  onchangedDept(String? value) {
    dropDownListSelectDeptValue = value!;
    notifyListeners();
  }
}
