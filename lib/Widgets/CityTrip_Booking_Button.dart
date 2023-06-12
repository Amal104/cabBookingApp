
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:taskiuser/Components/Toast.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';

import '../Screens/Estimate_Screen.dart';
import '../values/values.dart';

class CityTripBookingButton extends StatelessWidget {
  const CityTripBookingButton({
    super.key, required this.provider,
  });

  final  BookingProvider provider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        showCustomToast(context, "Trip successfully booked!");
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