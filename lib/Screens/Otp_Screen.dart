import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
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
    var defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColor.white,
      ),
      decoration: BoxDecoration(
        color: AppColor.secondaryShade,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.grey700, width: 3),
      ),
    );
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
                  height: height(context) * 0.02,
                ),
                // PinCodeTextField(
                //   appContext: context,
                //   length: 4,
                //   obscureText: false,
                //   animationType: AnimationType.fade,
                //   pinTheme: PinTheme(
                //     shape: PinCodeFieldShape.box,
                //     borderRadius: BorderRadius.circular(8),
                //     fieldHeight: 60,
                //     fieldWidth: 60,
                //     activeColor: AppColor.primary,
                //     selectedColor: AppColor.white,
                //     inactiveColor: AppColor.secondaryShade,
                //     fieldOuterPadding: EdgeInsets.symmetric(horizontal: 10)
                //   ),
                //   animationDuration: Duration(milliseconds: 300),
                //   textStyle: const TextStyle(color: AppColor.white,fontSize: 25),
                //   controller: provider.otpcontroller,
                //   onCompleted: (v) {
                //     print("Completed");
                //     // print(v);
                //     print("controller : ${provider.otpcontroller.text}");
                //   },
                //   onChanged: (value) {
                //     provider.isFourOtp();
                //   },
                //   beforeTextPaste: (text) {
                //     print("Allowing to paste $text");
                //     //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //     //but you can show anything you want here, like your pop up saying wrong paste format or etc
                //     return true;
                //   },
                // ),
                SizedBox(
                  height: height(context)*0.1,
                  child: Pinput(
                    controller: provider.otpcontroller,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                        autofillHints: const  [
                          AutofillHints.oneTimeCode
                        ],
                    focusNode: provider.focusNode,
                    closeKeyboardWhenCompleted: true,
                    defaultPinTheme: defaultPinTheme,
                    onChanged: (value) => provider.isFourOtp(),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColor.primary, width: 3),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    if (provider.haveOTP == false) {
                      print("object");
                      HapticFeedback.lightImpact();
                      CustomFlushBar.customFlushBar(
                          context, "Error", "Enter a valid otp");
                    }
                    if (provider.haveOTP == true) {
                      print("object1");
                      HapticFeedback.lightImpact();
                      provider.otpVerification(context);
                    }
                    print("ontap");
                  },
                  child: Container(
                    width: width(context),
                    // margin: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
                    padding:
                        EdgeInsets.symmetric(vertical: height(context) * 0.016),
                    decoration: BoxDecoration(
                      color: provider.haveOTP ? Colors.amber : AppColor.grey800,
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
