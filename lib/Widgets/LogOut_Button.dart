import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';
import 'package:taskiuser/values/values.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

