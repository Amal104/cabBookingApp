import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';
import 'package:taskiuser/Widgets/Otp_Field.dart';
import '../Components/Buttons.dart';
import '../Components/FlushBar.dart';
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
                        controller: provider.otpcontroller1,
                        provider: provider),
                    textFieldOTP(
                        first: false,
                        last: false,
                        context: context,
                        controller: provider.otpcontroller2,
                        provider: provider),
                    textFieldOTP(
                        first: false,
                        last: false,
                        context: context,
                        controller: provider.otpcontroller3,
                        provider: provider),
                    textFieldOTP(
                        first: false,
                        last: true,
                        context: context,
                        controller: provider.otpcontroller4,
                        provider: provider),
                  ],
                ),
                SizedBox(
                  height: height(context) * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    if(provider.haveOTP == false){
                      HapticFeedback.lightImpact();
                    CustomFlushBar.customFlushBar(
                        context, "Error", "Enter a Valid OTP");
                    }
                    if (provider.isOTP1 == true &&
                        provider.isOTP2 == true &&
                        provider.isOTP3 == true &&
                        provider.isOTP4 == true) {
                      HapticFeedback.lightImpact();
                      provider.otpVerification();
                    }
                  },
                  child: Container(
                    width: width(context),
                    // margin: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
                    padding:
                        EdgeInsets.symmetric(vertical: height(context) * 0.016),
                    decoration: BoxDecoration(
                      color:
                          provider.haveOTP ? Colors.amber : AppColor.grey800,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [],
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color:
                              provider.haveOTP ? Colors.black : AppColor.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
