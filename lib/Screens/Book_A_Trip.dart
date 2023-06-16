import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Components/AppBar.dart';
import 'package:taskiuser/Components/Buttons.dart';
import 'package:taskiuser/Screens/Estimate_Screen.dart';
import 'package:taskiuser/Widgets/PageTitle.dart';

import '../values/values.dart';

class BookATrip extends StatelessWidget {
  const BookATrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "Book a trip", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.42,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: height(context) * 0.04,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: AppColor.secondaryShadev2,
                hintText: "Source",
                hintStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColor.white,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: height(context) * 0.025,
                      width: width(context) * 0.08,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                    Container(
                      height: height(context) * 0.013,
                      width: width(context) * 0.03,
                      decoration: const BoxDecoration(
                        color: AppColor.secondaryShadev2,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.white,
              ),
            ),
            SizedBox(
              height: height(context) * 0.015,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: AppColor.secondaryShadev2,
                hintText: "Destination",
                hintStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColor.white,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: height(context) * 0.025,
                      width: width(context) * 0.08,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    ),
                    Container(
                      height: height(context) * 0.013,
                      width: width(context) * 0.03,
                      decoration: const BoxDecoration(
                        color: AppColor.secondaryShadev2,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.white,
              ),
            ),
            SizedBox(
              height: height(context) * 0.03,
            ),
            customButton(
              context,
              "Continue",
              () {
                showModalBottomSheet(
                  backgroundColor: AppColor.transparent,
                  barrierColor: AppColor.transparent,
                  context: context,
                  builder: (context) => Estimate(),
                );
              },
              10,
              null,
            )
          ],
        ),
      ),
    );
  }
}
