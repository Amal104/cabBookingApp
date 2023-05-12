
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Provider/Booking_Provider.dart';
import '../values/values.dart';

class CityTripCabType extends StatelessWidget {
  const CityTripCabType({
    super.key, required this.provider,
  });

  final BookingProvider provider;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: width(context) * 0.035,
      direction: Axis.horizontal,
      children: List.generate(
        4,
        (index) => GestureDetector(
          onTap: () {
            provider.selectedCityCab(index);
          },
          onLongPress: () {
            HapticFeedback.heavyImpact();
            showModalBottomSheet(
              context: context,
              barrierColor: const Color(0xAC000000),
              backgroundColor: AppColor.transparent,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    color: AppColor.secondary,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.04,
                      vertical: height(context) * 0.025,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Zipp",
                              style: GoogleFonts.inter(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                              ),
                            ),
                            SizedBox(
                              width: width(context) * 0.04,
                            ),
                            Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.solidUser,
                                  color: AppColor.primary,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: width(context) * 0.01,
                                ),
                                Text(
                                  "3",
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height(context) * 0.02,
                        ),
                        SizedBox(
                          width: width(context),
                          child: Text(
                            "Comfortable hatchback gives you a complete business class ride ideally for short drives and city.",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.015,
                        ),
                        Wrap(
                          spacing: 15,
                          direction: Axis.horizontal,
                          children: [
                            Container(
                              height: height(context) * 0.09,
                              width: width(context) * 0.2,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryShadev2,
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/car.svg",
                                      color: AppColor.primary,
                                      height: 30,
                                    ),
                                    Text(
                                      "Spacious\nInterior",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: AppColor.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: height(context) * 0.09,
                              width: width(context) * 0.2,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryShadev2,
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/suitcase.svg",
                                      color: AppColor.primary,
                                      height: 25,
                                    ),
                                    Text(
                                      "Spacious\nInterior",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: AppColor.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: height(context) * 0.09,
                              width: width(context) * 0.2,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryShadev2,
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              height: height(context) * 0.09,
                              width: width(context) * 0.2,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryShadev2,
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height(context) * 0.015,
                        ),
                        Container(
                          width: width(context),
                          padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.035,
                            vertical: height(context) * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Etios, Celerio",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
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
                // FaIcon(FontAwesomeIcons.circleInfo,size: 12,),
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
    );
  }
}