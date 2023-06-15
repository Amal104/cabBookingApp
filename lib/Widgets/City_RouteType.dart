import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Provider/Booking_Provider.dart';
import '../values/values.dart';

class CityRouteType extends StatelessWidget {
  const CityRouteType({
    super.key,
    required this.provider,
  });

  final BookingProvider provider;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        children: List.generate(
          2,
          (index) => GestureDetector(
            onTap: () {
              provider.selectedCityTrip(index);
            },
            child: Container(
              height: height(context) * 0.04,
              width: width(context) * 0.3,
              decoration: BoxDecoration(
                  color: provider.selectedCityTripIndex == index
                      ? AppColor.primary
                      : AppColor.secondaryShadev2,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "One way",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    color: provider.selectedCityTripIndex == index
                        ? AppColor.black
                        : AppColor.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
