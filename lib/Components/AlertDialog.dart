import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';

import '../Screens/Login_Screen.dart';
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
              // icon:const CircleAvatar(
              //   backgroundImage: NetworkImage(
              //     AppUrls.user,
              //   ),
              // ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
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
                      color: AppColor.grey,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
