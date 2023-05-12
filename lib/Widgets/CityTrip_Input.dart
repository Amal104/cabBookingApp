
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Provider/Booking_Provider.dart';
import '../values/values.dart';

class CityTripInput extends StatelessWidget {
  const CityTripInput({
    super.key, required this.provider,
  });
  final BookingProvider provider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width(context),
          child: Column(
            children: [
              SizedBox(
                height: height(context) * 0.06,
                child: TextField(
                  controller: provider.cityTripFromController,
                  style: GoogleFonts.inter(
                      color: AppColor.white,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    labelText: "From",
                    labelStyle: GoogleFonts.inter(
                      color: AppColor.white,
                      letterSpacing: 0.5,
                    ),
                    floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                    floatingLabelStyle:
                        GoogleFonts.inter(color: AppColor.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColor.secondaryShadev2,
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.secondaryShadev2,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height(context) * 0.015,
              ),
              SizedBox(
                height: height(context) * 0.06,
                child: TextField(
                  controller: provider.cityTripToController,
                  style: GoogleFonts.inter(
                      color: AppColor.white,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    labelText: "To",
                    labelStyle: GoogleFonts.inter(
                      color: AppColor.white,
                      letterSpacing: 0.5,
                    ),
                    floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                    floatingLabelStyle:
                        GoogleFonts.inter(color: AppColor.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColor.secondaryShadev2,
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.secondaryShadev2,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            provider.swap();
            HapticFeedback.lightImpact();
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            height: height(context) * 0.045,
            width: width(context) * 0.085,
            decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(5)),
            child: SvgPicture.asset(
              "assets/icons/arrows.svg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}