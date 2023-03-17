import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taskiuser/Screens/Home_Screen.dart';
import 'package:taskiuser/Widgets/Otp_Field.dart';

import '../Constants/Buttons.dart';
import '../Constants/Colors.dart';
import '../Constants/Size.dart';
import '../Constants/Strings.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height(context) * 0.04,
              ),
              Align(
                child: Image.asset(
                  taSkiWhiteLogo,
                  height: height(context) * 0.15,
                ),
              ),
              SizedBox(
                height: height(context) * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width(context) * 0.03),
                    child: const Text(
                      "Phone Verification",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.003,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width(context) * 0.03),
                    child: const Text(
                      "Enter your OTP code here",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height(context) * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  textFieldOTP(first: true, last: false, context: context),
                  textFieldOTP(first: false, last: false, context: context),
                  textFieldOTP(first: false, last: false, context: context),
                  textFieldOTP(first: false, last: true, context: context),
                ],
              ),
              SizedBox(
                height: height(context) * 0.03,
              ),
              customButton(context, "Login", () {
                Get.to(()=> const HomePage());
              }),
            ],
          ),
        )),
      ),
    );
  }
}
