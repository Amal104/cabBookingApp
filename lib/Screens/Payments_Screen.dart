import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/values.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(
            left: width(context) * 0.05,
            top: height(context) * 0.01,
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width(context) * 0.05),
                  child: Container(
                    width: width(context) * 0.32,
                    height: height(context) * 0.05,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: width(context) * 0.03),
                        child: Text(
                          "Payments",
                          style: GoogleFonts.inter(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width(context) * 0.11,
                  height: height(context) * 0.052,
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      color: AppColor.primary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height(context) * 0.05,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width(context) * 0.05,
              vertical: height(context) * 0.01),
          child: Container(
            height: height(context) * 0.09,
            width: width(context),
            decoration: BoxDecoration(
              color: AppColor.secondaryShade,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "taSkiMoney",
                  style: GoogleFonts.inter(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width(context) * 0.05,
              vertical: height(context) * 0.01),
          child: Container(
            height: height(context) * 0.09,
            width: width(context),
            decoration: BoxDecoration(
              color: AppColor.secondaryShade,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "LinkPaytm",
                  style: GoogleFonts.inter(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  height: height(context) * 0.05,
                  width: width(context) * 0.1,
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
