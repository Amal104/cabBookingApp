import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';

import '../Components/AppBar.dart';
import '../Widgets/PageTitle.dart';
import '../values/values.dart';

class MobileUpdateOTPScreen extends StatelessWidget {
  const MobileUpdateOTPScreen({super.key, required this.provider});

  final ProfileProvider provider;

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "Update Mobile", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.48,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height(context) * 0.08,
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
            SizedBox(
              height: height(context) * 0.1,
              child: Pinput(
                controller: provider.updateOtpControler,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                autofillHints: const [AutofillHints.oneTimeCode],
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
                HapticFeedback.lightImpact();
                provider.updateProfile(context);
                Navigator.of(context).pop();
              },
              child: Container(
                width: width(context),
                // margin: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
                padding: EdgeInsets.symmetric(vertical: height(context) * 0.016),
                decoration: BoxDecoration(
                  color: provider.haveOTP ? Colors.amber : AppColor.grey800,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [],
                ),
                child: Center(
                  child: Text(
                    "UPDATE",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: provider.haveOTP ? Colors.black : AppColor.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
