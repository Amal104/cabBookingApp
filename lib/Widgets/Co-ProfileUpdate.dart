import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/Buttons.dart';
import 'package:taskiuser/Components/TextField.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';

import '../Components/AppBar.dart';
import '../values/values.dart';
import 'PageTitle.dart';

class CoProfileUpdate extends StatelessWidget {
  const CoProfileUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "Corporate Update", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.55,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.03),
          child: Consumer<ProfileProvider>(
            builder: (context, provider, child) => Column(
              children: [
                SizedBox(
                  height: height(context) * 0.04,
                ),
                CustomTextField.customBorderTextField(null, null, "Name"),
                SizedBox(
                  height: height(context) * 0.025,
                ),
                CustomTextField.customBorderTextField(null, null, "Email"),
                SizedBox(
                  height: height(context) * 0.025,
                ),
                CustomTextField.customBorderTextField(null, null, "Empolyee id"),
                SizedBox(
                  height: height(context) * 0.025,
                ),
                CustomTextField.customBorderTextField(null, null, "Designation"),
                SizedBox(
                  height: height(context) * 0.025,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(8)),
                  child: DropdownButton<String>(
                    value: provider.dropDownListSelectBranchValue,
                    dropdownColor: AppColor.secondaryShadev2,
                    icon: const FaIcon(
                      FontAwesomeIcons.chevronDown,
                      size: 12,
                      color: AppColor.white,
                    ),
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.03,
                    ),
                    onChanged: (String? newValue) {
                      provider.onchangedBranch(newValue!);
                    },
                    items: provider.dropDownListSelectBranch
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.015,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(8)),
                  child: DropdownButton<String>(
                    value: provider.dropDownListSelectDeptValue,
                    dropdownColor: AppColor.secondaryShadev2,
                    icon: const FaIcon(
                      FontAwesomeIcons.chevronDown,
                      size: 12,
                      color: AppColor.white,
                    ),
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.03,
                    ),
                    onChanged: (String? newValue) {
                      provider.onchangedDept(newValue!);
                    },
                    items: provider.dropDownListSelectDept
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.025,
                ),
                CustomTextField.customBorderTextField(null, null, "Manager name"),
                SizedBox(
                  height: height(context) * 0.025,
                ),
                CustomTextField.customBorderTextField(
                    null, null, "Manager mobile"),
                SizedBox(
                  height: height(context) * 0.025,
                ),
                CustomTextField.customBorderTextField(
                    null, null, "Manager email"),
                SizedBox(
                  height: height(context) * 0.025,
                ),
                customButton(context, "UPDATE", () {}, 8)
              ],
            ),
          ),
        ),
      ),
    );
  }
}