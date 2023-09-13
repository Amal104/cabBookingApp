import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/FlushBar.dart';
import 'package:taskiuser/Models/Profile_Model.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';
import 'package:taskiuser/Screens/Home_Screen.dart';
import 'package:taskiuser/Screens/Co-ProfileUpdate.dart';
import 'package:taskiuser/Screens/ProfileUpdate.dart';
import 'package:taskiuser/Screens/Profile_Signature_Screen.dart';
import 'package:taskiuser/Screens/SignatureScreen.dart';
import 'package:taskiuser/values/values.dart';

import 'MobileUpdateOTPScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false)
        .getProfileData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<ProfileProvider>(
            builder: (context, provider, child) => Column(
              children: [
                SizedBox(
                  height: height(context) * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const HomePage(),
                            transition: Transition.leftToRight);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: width(context) * 0.02),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: height(context) * 0.05,
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: width(context) * 0.05,
                                        left: width(context) * 0.125),
                                    child: Text(
                                      "Profile",
                                      style: GoogleFonts.inter(
                                        color: AppColor.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: width(context) * 0.11,
                                height: height(context) * 0.050,
                                decoration: BoxDecoration(
                                  color: AppColor.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.chevronLeft,
                                    color: AppColor.primary,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width(context) * 0.03),
                      child: Consumer<LoginProvider>(
                        builder: (context, provider, child) => GestureDetector(
                          onTap: () {
                            // CustomAlertDialog.logOutyescancelDialog(
                            //     context, "Logout", "Do you want to logout?");
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              headerAnimationLoop: false,
                              title: "Logout",
                              desc: "Do you want to logout?",
                              btnCancelText: "Cancel",
                              btnOkText: "Ok",
                              dialogType: DialogType.WARNING,
                              btnCancelColor: AppColor.primary,
                              btnOk: TextButton(
                                child: Text(
                                  "Ok",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                                onPressed: () {
                                  provider.logout();
                                },
                              ),
                              btnCancel: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                                ),
                              ),
                            ).show();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width(context) * 0.035),
                            height: height(context) * 0.05,
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.rightFromBracket),
                                SizedBox(
                                  width: width(context) * 0.02,
                                ),
                                Text(
                                  "Logout",
                                  style: GoogleFonts.inter(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height(context) * 0.04,
                ),
                Hero(
                  tag: "Profile",
                  child: Container(
                    height: height(context) * 0.08,
                    width: width(context) * 0.17,
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.solidUser,
                        color: AppColor.secondaryShadev2,
                        size: height(context) * 0.042,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.015,
                ),
                Text(
                  provider.profile?.name ?? "",
                  style: GoogleFonts.inter(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                SizedBox(
                  width: width(context) * 0.8,
                  child: ProfileData(
                      profile: provider.profile, provider: provider),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileData extends StatelessWidget {
  const ProfileData({
    super.key,
    required this.profile,
    required this.provider,
  });
  final ProfileModel? profile;
  final ProfileProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Name",
            style: GoogleFonts.inter(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.007,
        ),
        ProfileDataField(
          data: profile?.name ?? "",
          title: "Update Name",
          type: "Name",
          update: "Update your Name",
          isMobile: false,
          provider: provider,
          controller: provider.profileUpdateName,
          function: () {
            HapticFeedback.lightImpact();
            provider.updateProfile(context);
          },
        ),
        SizedBox(
          height: height(context) * 0.025,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Email",
            style: GoogleFonts.inter(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.007,
        ),
        ProfileDataField(
          data: profile?.email ?? "",
          title: "Update Email",
          type: "Email",
          update: "Update your Email",
          isMobile: false,
          provider: provider,
          controller: provider.profileUpdateEmail,
          function: () {
            HapticFeedback.lightImpact();
            provider.updateProfile(context);
          },
        ),
        SizedBox(
          height: height(context) * 0.025,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Mobile",
            style: GoogleFonts.inter(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.007,
        ),
        ProfileDataField(
          data: profile?.mobile ?? "",
          title: "Update Mobile",
          type: "Mobile",
          update: "Update your mobile number",
          isMobile: true,
          provider: provider,
          controller: null,
          phoneController: provider.profileUpdateMobile,
          function: () {
            if (provider.profileUpdateMobile.text.length == 10) {
              if (kDebugMode) {
                print(provider.profileUpdateCountryCode +
                    provider.profileUpdateMobile.text);
              }
              provider.updateProfile(context);
              Get.to(
                () => MobileUpdateOTPScreen(provider: provider),
                transition: Transition.rightToLeft,
              );
            } else {
              CustomFlushBar.customFlushBar(
                  context, "Error", "Enter valid mobile number");
            }
          },
        ),
        SizedBox(
          height: height(context) * 0.025,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Corporate",
            style: GoogleFonts.inter(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.007,
        ),
        GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            Get.to(
              () => const CoProfileUpdate(),
              transition: Transition.rightToLeft,
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width(context) * 0.05,
                vertical: height(context) * 0.015),
            // height: height(context) * 0.065,
            width: width(context) * 0.8,
            decoration: BoxDecoration(
              color: AppColor.secondaryShade,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (profile?.corporate.image != null)
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          profile?.corporate.image ?? "",
                          scale: 20,
                        ),
                      ),
                    SizedBox(
                      width: width(context) * 0.03,
                    ),
                    Text(
                      profile?.corporate.corporateName ?? "",
                      style: GoogleFonts.inter(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: AppColor.primary,
                  size: 20,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.025,
        ),
        if (profile?.isSignatureRequired ?? false)
          GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              Get.to(
                () => SignatureScreen(signature: profile?.signature ?? ""),
                transition: Transition.rightToLeft,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
              height: height(context) * 0.065,
              width: width(context) * 0.8,
              decoration: BoxDecoration(
                color: AppColor.secondaryShade,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Signature",
                    style: GoogleFonts.inter(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: AppColor.primary,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class ProfileDataField extends StatelessWidget {
  const ProfileDataField({
    super.key,
    required this.data,
    required this.title,
    required this.type,
    required this.update,
    required this.isMobile,
    this.function,
    required this.controller,
    required this.provider,
    this.phoneController,
  });

  final String data;
  final String title;
  final String type;
  final String update;
  final bool isMobile;
  final void Function()? function;
  final TextEditingController? controller;
  final TextEditingController? phoneController;
  final ProfileProvider provider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        Get.to(
          () => ProfileUpdate(
            title: title,
            type: type,
            update: update,
            isMobile: isMobile,
            function: function,
            controller: controller,
            phoneController: phoneController,
            provider: provider,
          ),
          transition: Transition.rightToLeft,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
        height: height(context) * 0.065,
        width: width(context) * 0.8,
        decoration: BoxDecoration(
          color: AppColor.secondaryShade,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data,
              style: GoogleFonts.inter(
                color: AppColor.white,
                fontSize: 16,
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.chevronRight,
              color: AppColor.primary,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
