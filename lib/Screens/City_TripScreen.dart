import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import 'package:taskiuser/values/values.dart';
import '../Widgets/CityTrip_Booking_Button.dart';
import '../Widgets/CityTrip_CabType.dart';
import '../Widgets/CityTrip_Date_Selection.dart';
import '../Widgets/CityTrip_Input.dart';
import '../Widgets/City_RouteType.dart';

class CityTripScreen extends StatelessWidget {
  const CityTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<BookingProvider>(
        builder: (context, provider, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.025),
            color: AppColor.black,
            child: Column(
              children: [
                SizedBox(
                  height: height(context) * 0.015,
                ),
                CityRouteType(provider: provider),
                SizedBox(
                  height: height(context) * 0.02,
                ),
                CityTripInput(
                  provider: provider,
                ),
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
                CityTripCabType(provider: provider),
                SizedBox(
                  height: height(context) * 0.015,
                ),
                const CityTripBookingButton(),
                SizedBox(
                  height: height(context) * 0.01,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
