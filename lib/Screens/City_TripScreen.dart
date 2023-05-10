import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import 'package:taskiuser/Screens/Estimate_Screen.dart';
import 'package:taskiuser/values/values.dart';

class CityTripScreen extends StatelessWidget {
  const CityTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<BookingProvider>(builder: (context, provider, child) {
        if (provider.a != true) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.025),
            color: AppColor.black,
            child: Column(
              children: [
                SizedBox(
                  height: height(context) * 0.015,
                ),
                Align(
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
                            "ONE WAY",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: provider.selectedCityTripIndex == index
                                  ? AppColor.black
                                  : AppColor.white,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.02,
                ),
                Stack(
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
                ),
                SizedBox(
                  height: height(context) * 0.015,
                ),
                Row(
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
                ),
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
                Wrap(
                  spacing: width(context) * 0.035,
                  direction: Axis.horizontal,
                  children: List.generate(
                    4,
                    (index) => GestureDetector(
                      onTap: () {
                        provider.selectedCityCab(index);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.02),
                        height: height(context) * 0.11,
                        width: width(context) * 0.21,
                        decoration: BoxDecoration(
                          color: provider.selectedCityCabIndex == index
                              ? AppColor.primary
                              : AppColor.secondaryShadev2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/zipp.svg",
                            ),
                            SizedBox(
                              height: height(context) * 0.006,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Zipp\n\u{20B9}11202",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: provider.selectedCityCabIndex == index
                                      ? AppColor.black
                                      : AppColor.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.015,
                ),
                GestureDetector(
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
                ),
                SizedBox(
                  height: height(context) * 0.01,
                ),
              ],
            ),
          );
        } else {
          return GestureDetector(
              onTap: () => provider.changeScreenback(),
              child: const Estimate());
        }
      }),
    );
  }
}
