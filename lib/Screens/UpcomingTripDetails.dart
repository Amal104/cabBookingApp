import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/AppBar.dart';
import '../Widgets/PageTitle.dart';
import '../values/values.dart';

class UpcomingTripDetails extends StatelessWidget {
  const UpcomingTripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.132),
        child: CustomAppbarPage(
          title: null,
          leading: const PageTitle(title: "Trip Details", padding: 0),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.42,
          bottom: null,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height(context) * 0.3,
            color: AppColor.grey,
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: AppColor.secondary,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.03,
                    vertical: height(context) * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apr 04 2023 06:42",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.02,
                            vertical: height(context) * 0.008,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.secondaryShade,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Approver",
                            style: GoogleFonts.inter(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: height(context) * 0.02,
                              width: width(context) * 0.04,
                              decoration: const BoxDecoration(
                                  color: AppColor.white,
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              height: height(context) * 0.013,
                              width: width(context) * 0.03,
                              decoration: const BoxDecoration(
                                color: AppColor.primary,
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: width(context) * 0.025,
                        ),
                        Text(
                          "Edapplly, Kerala, India",
                          maxLines: 1,
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.008,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: height(context) * 0.02,
                              width: width(context) * 0.04,
                              decoration: const BoxDecoration(
                                  color: AppColor.white,
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              height: height(context) * 0.013,
                              width: width(context) * 0.03,
                              decoration: const BoxDecoration(
                                color: AppColor.secondary,
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: width(context) * 0.025,
                        ),
                        Text(
                          "Kakkanad, Kakkanad, Kerala, India",
                          maxLines: 1,
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColor.grey,
                      height: height(context) * 0.05,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: height(context) * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trip ID",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "1563245879632564",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "amal@taski.in",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Branch",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Test Taski",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trip Type",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Hire",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Purpose",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Genaral",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Distance",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "100 KM",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Time",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "100 Min",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04),
            height: height(context) * 0.08,
            color: AppColor.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TOTAL",
                      style: GoogleFonts.inter(
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Corporate Credit",
                      style: GoogleFonts.inter(
                        color: AppColor.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height(context) * 0.08,
                  width: width(context) * 0.115,
                  decoration: const BoxDecoration(
                    color: AppColor.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.xmark,
                      size: 15,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
