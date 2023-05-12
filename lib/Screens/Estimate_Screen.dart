import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import 'package:taskiuser/Widgets/CityTrip_CabType.dart';
import 'package:taskiuser/Widgets/City_RouteType.dart';
import 'package:taskiuser/values/values.dart';
import '../Widgets/CityTrip_Date_Selection.dart';

class Estimate extends StatelessWidget {
  const Estimate({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<BookingProvider>(
        builder: (context, provider, child) => Container(
          height: height(context) * 0.42,
          width: width(context),
          decoration: const BoxDecoration(
            color: AppColor.black,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(context) * 0.02,
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: height(context) * 0.02),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CityRouteType(provider: provider),
                SizedBox(
                  height: height(context) * 0.015,
                ),
                CityTripCabType(provider: provider),
                SizedBox(
                  height: height(context) * 0.015,
                ),
                CityTripDateSelection(provider: provider),
                if (provider.selectedCityTripIndex == 1)
                  SizedBox(
                    height: height(context) * 0.015,
                  ),
                if (provider.selectedCityTripIndex == 1)
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height(context) * 0.0125,
                      horizontal: width(context) * 0.03,
                    ),
                    height: height(context) * 0.055,
                    width: width(context),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(
                  height: height(context) * 0.015,
                ),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.heavyImpact();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
