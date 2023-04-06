import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/UpcomingTripDetails.dart';
import '../values/values.dart';

class PastTab extends StatelessWidget {
  const PastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
          top: height(context) * 0.04, bottom: height(context) * 0.04),
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => const UpcomingTripDetails(),
              transition: Transition.rightToLeft,
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: width(context) * 0.04,
              vertical: height(context) * 0.01,
            ),
            height: height(context) * 0.3,
            width: width(context),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: width(context),
                    decoration: const BoxDecoration(
                      color: AppColor.secondaryShadev2,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width(context) * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Apr 06, 2023 11:28 AM",
                                style: GoogleFonts.inter(
                                  color: AppColor.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: height(context) * 0.005,
                              ),
                              Text(
                                "BMW M5 CS",
                                style: GoogleFonts.inter(
                                  color: AppColor.primary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Credit",
                                style: GoogleFonts.inter(
                                  color: AppColor.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: width(context) * 0.05,
                              ),
                              const FaIcon(
                                FontAwesomeIcons.chevronRight,
                                color: AppColor.primary,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: width(context),
                    decoration: const BoxDecoration(
                      color: AppColor.grey,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
