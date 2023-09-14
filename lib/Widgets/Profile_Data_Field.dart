import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';
import 'package:taskiuser/Screens/ProfileUpdate.dart';
import 'package:taskiuser/values/values.dart';

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
