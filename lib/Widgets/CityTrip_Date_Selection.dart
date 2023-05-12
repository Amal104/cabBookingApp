
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Provider/Booking_Provider.dart';
import '../values/values.dart';

class CityTripDateSelection extends StatelessWidget {
  const CityTripDateSelection({
    super.key, required this.provider,
  });

  final BookingProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => provider.datePicker(context, "city"),
            child: Container(
              height: height(context) * 0.055,
              decoration: BoxDecoration(
                color: AppColor.secondaryShade,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: provider.cityOneWayDate != ""
                    ? Text(
                        provider.cityOneWayDate,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: AppColor.white,
                        ),
                      )
                    : Text(
                        "Select Date & Time",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: AppColor.white,
                        ),
                      ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width(context) * 0.035,
        ),
        if (provider.selectedCityTripIndex != 1)
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: height(context) * 0.0125,
                horizontal: width(context) * 0.03,
              ),
              height: height(context) * 0.055,
              decoration: BoxDecoration(
                color: AppColor.secondaryShade,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/icons/rupee.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Personal Cash",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColor.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        if (provider.selectedCityTripIndex == 1)
          Expanded(
            child: GestureDetector(
              onTap: () => provider.datePicker(context, "city2"),
              child: Container(
                height: height(context) * 0.055,
                decoration: BoxDecoration(
                  color: AppColor.secondaryShade,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: provider.cityReturnDate != ""
                      ? Text(
                          provider.cityReturnDate,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        )
                      : Text(
                          "Select Date & Time",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}