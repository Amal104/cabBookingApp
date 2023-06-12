import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';
import '../values/values.dart';

class CustomAlertDialog {
  static logOutyescancelDialog(
      BuildContext context, String title, String content) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer<LoginProvider>(
            builder: (context, provider, child) => AlertDialog(
              actionsAlignment: MainAxisAlignment.end,
              icon: Align(
                alignment: Alignment.topLeft,
                child: Container(
                height: height(context) * 0.05,
                width: width(context) * 0.10,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: AppColor.secondaryShadev2,
                    size: height(context) * 0.032,
                  ),
                ),
              ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              content: Text(
                content,
                style: GoogleFonts.inter(
                  fontSize: 15.0,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    provider.logout();
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
