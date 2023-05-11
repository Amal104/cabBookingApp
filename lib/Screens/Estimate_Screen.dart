import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import 'package:taskiuser/Widgets/Otp_Field.dart';
import 'package:taskiuser/values/values.dart';

class Estimate extends StatelessWidget {
  const Estimate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, provider, child) => Container(
        height: height(context) * 0.55,
        width: width(context),
        decoration: const BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Estimated Amount",
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColor.primary,
              ),
            ),
            Container(
              height: height(context)*0.2,
              width: width(context)*0.2,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20)
              ),
            )
          ],
        ),
      ),
    );
  }
}
