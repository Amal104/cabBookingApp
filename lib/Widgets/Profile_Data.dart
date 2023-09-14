import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Components/FlushBar.dart';
import 'package:taskiuser/Models/Profile_Model.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';
import 'package:taskiuser/Screens/Co-ProfileUpdate.dart';
import 'package:taskiuser/Screens/MobileUpdateOTPScreen.dart';
import 'package:taskiuser/Screens/SignatureScreen.dart';
import 'package:taskiuser/Widgets/Profile_Data_Field.dart';
import 'package:taskiuser/values/values.dart';


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
              if (provider.updateMobileTrue == true) {
                Get.to(
                  () => MobileUpdateOTPScreen(provider: provider),
                  transition: Transition.rightToLeft,
                );
              }
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
