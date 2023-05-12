
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/Estimate_Screen.dart';
import '../values/values.dart';

class CityTripBookingButton extends StatelessWidget {
  const CityTripBookingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
        showModalBottomSheet(
          barrierColor: AppColor.transparent,
          backgroundColor: AppColor.transparent,
          elevation: 0,
          context: context,
          builder: (context) => const Estimate(),
        );
      },
      child: Container(
        width: width(context),
        height: height(context) * 0.06,
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "CONFIRM",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}