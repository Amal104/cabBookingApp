import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  List<String> dropDownListSelectBranch = ["Select Branch", "Kochi","Bangalore"];
  List<String> dropDownListSelectDept = ["Select Department","Test","Develop"];

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
