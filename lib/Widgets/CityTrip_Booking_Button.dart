import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Components/Toast.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import 'package:taskiuser/Screens/Rating_Screen.dart';
import '../values/values.dart';

class CityTripBookingButton extends StatelessWidget {
  const CityTripBookingButton({
    super.key,
    required this.provider,
  });

  final BookingProvider provider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        showSuccessToast(context, "Trip successfully booked!");
        Future.delayed(const Duration(seconds: 3), () {
          Get.to(() => const RatingScreen(), transition: Transition.zoom);
        });
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
