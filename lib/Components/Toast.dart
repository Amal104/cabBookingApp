import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../values/values.dart';

showSuccessToast(BuildContext context, String message) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Column(
    children: [
      LottieBuilder.asset(
        "assets/Lottie/Successful.json",
        repeat: false,
        fit: BoxFit.cover,
        height: height(context) * 0.12,
      ),
      Text(
        "Trip booked successfully!",
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColor.black,
        ),
      )
    ],
  );
  fToast.showToast(
    child: toast,
    toastDuration: const Duration(seconds: 2),
    gravity: ToastGravity.TOP,
  );
}

showSuccess() {
  LottieBuilder.asset("assets/Lottie/Successful.json");
}

showCustomToast(BuildContext context, String message) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: GoogleFonts.inter(
            fontSize: 10,
            color: AppColor.black,
          ),
        ),
      )
    ],
  );
  fToast.showToast(
    child: toast,
    toastDuration: const Duration(seconds: 2),
    gravity: ToastGravity.BOTTOM,
  );
}
