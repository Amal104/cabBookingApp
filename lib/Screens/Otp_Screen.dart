import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';
import 'package:taskiuser/Widgets/Otp_Field.dart';
import '../Components/Buttons.dart';
import '../values/values.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, provider, child) => SafeArea(
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
                    textFieldOTP(
                        first: true,
                        last: false,
                        context: context,
                        controller: provider.otpcontroller1),
                    textFieldOTP(
                        first: false,
                        last: false,
                        context: context,
                        controller: provider.otpcontroller2),
                    textFieldOTP(
                        first: false,
                        last: false,
                        context: context,
                        controller: provider.otpcontroller3),
                    textFieldOTP(
                        first: false,
                        last: true,
                        context: context,
                        controller: provider.otpcontroller4),
                  ],
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                customButton(
                  context,
                  "Login",
                  () {
                    HapticFeedback.lightImpact();
                    provider.otpVerification();
                  },
                  15,
                  null,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
