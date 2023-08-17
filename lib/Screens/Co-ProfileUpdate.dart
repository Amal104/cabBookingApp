import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskiuser/Components/Buttons.dart';
import 'package:taskiuser/Components/TextField.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';

import '../Components/AppBar.dart';
import '../values/values.dart';
import '../Widgets/PageTitle.dart';

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
          child: Consumer<ProfileProvider>(builder: (context, provider, child) {
            var coProfile = provider.profile?.corporate;
            return provider.profile?.corporate != null
                ? Column(
                    children: [
                      SizedBox(
                        height: height(context) * 0.04,
                      ),
                      CustomTextField(
                        controller: provider.nameControler,
                        hint: "Enter your name",
                        label: "Name",
                        initialValue: coProfile?.name,
                      ),
                      SizedBox(
                        height: height(context) * 0.02,
                      ),
                      CustomTextField(
                        controller: provider.emailControler,
                        hint: "Enter your email",
                        label: "Email",
                        initialValue: provider.profile?.email,
                      ),
                      SizedBox(
                        height: height(context) * 0.02,
                      ),
                      CustomTextField(
                        controller: provider.employeeIdControler,
                        hint: "Enter your employee id",
                        label: "Employee Id",
                        initialValue: coProfile?.empcode,
                      ),
                      SizedBox(
                        height: height(context) * 0.02,
                      ),
                      CustomTextField(
                        controller: provider.designationControler,
                        hint: "Enter your designation",
                        label: "Designation",
                        initialValue: coProfile?.designation,
                      ),
                      SizedBox(
                        height: height(context) * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.secondaryShade,
                            borderRadius: BorderRadius.circular(8)),
                        child: DropdownButton(
                          value: provider.dropDownListSelectBranchValue,
                          dropdownColor: AppColor.secondaryShadev2,
                          hint: Text(
                            "Select Branch",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: AppColor.white,
                            ),
                          ),
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
                          onChanged: (newValue) {
                            provider.onchangedBranch(newValue!.toString());
                          },
                          items: provider.profile!.branch.map((e) {
                            return DropdownMenuItem(
                              value: e.name,
                              child: Text(
                                e.name,
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
                        child: DropdownButton(
                          value: provider.dropDownListSelectDeptValue,
                          dropdownColor: AppColor.secondaryShadev2,
                          hint: Text(
                            "Select Department",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: AppColor.white,
                            ),
                          ),
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
                          onChanged: (newValue) {
                            provider.onchangedDept(newValue.toString());
                          },
                          items: provider.profile!.department.map((e) {
                            return DropdownMenuItem(
                              value: e.name,
                              child: Text(
                                e.name,
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
                      CustomTextField(
                        controller: provider.managerNameControler,
                        hint: "Enter your Manager name...",
                        label: "Manager Name",
                        initialValue: coProfile?.reportingManager,
                      ),
                      SizedBox(
                        height: height(context) * 0.02,
                      ),
                      CustomTextField(
                        controller: provider.managerMobileControler,
                        hint: "Enter your Manager mobile",
                        label: "Manager Mobile",
                        initialValue: coProfile?.reportingManagerMobile,
                      ),
                      SizedBox(
                        height: height(context) * 0.02,
                      ),
                      CustomTextField(
                        controller: provider.managerEmailControler,
                        hint: "Enter your Manager email",
                        label: "Manager Email",
                        initialValue: coProfile?.reportingManagerEmail,
                      ),
                      SizedBox(
                        height: height(context) * 0.025,
                      ),
                      CustomButton(context: context, text: "UPDATE", radius: 8),
                    ],
                  )
                : Shimmer.fromColors(
                    baseColor: AppColor.grey800,
                    highlightColor: AppColor.grey,
                    child: SizedBox(
                      height: height(context),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => 
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: width(context),
                            height: height(context) * 0.05,
                            decoration: BoxDecoration(
                                color: AppColor.secondaryShadev2,
                                borderRadius: BorderRadius.circular(8)),
                          )
                      ),
                    ));
          }),
        ),
      ),
    );
  }
}
