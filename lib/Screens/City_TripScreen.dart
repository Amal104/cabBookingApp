import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/values/values.dart';

class CityTripScreen extends StatelessWidget {
  const CityTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: height(context) * 0.02, horizontal: width(context) * 0.05),
      color: AppColor.black,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: height(context) * 0.05,
                width: width(context) * 0.3,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "ONE WAY",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
              SizedBox(
                width: width(context) * 0.025,
              ),
              Container(
                height: height(context) * 0.05,
                width: width(context) * 0.3,
                decoration: BoxDecoration(
                    color: AppColor.secondary,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "ROUND TRIP",
                    style: GoogleFonts.inter(
                      color: AppColor.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height(context) * 0.02,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: height(context) * 0.04,
                width: width(context) * 0.08,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: SvgPicture.asset("assets/icons/arrows.svg",
                    fit: BoxFit.none),
              ),
              SizedBox(
                width: width(context),
                child: Column(
                  children: [
                    TextField(
                      style: GoogleFonts.inter(
                          color: AppColor.white, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: "From",
                        labelStyle: GoogleFonts.inter(
                          color: AppColor.white,
                          letterSpacing: 0.5,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelStyle:
                            GoogleFonts.inter(color: AppColor.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: AppColor.secondaryShade, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColor.secondaryShade,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.015,
                    ),
                    TextField(
                      style: GoogleFonts.inter(
                          color: AppColor.white, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: "To",
                        labelStyle: GoogleFonts.inter(
                          color: AppColor.white,
                          letterSpacing: 0.5,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelStyle:
                            GoogleFonts.inter(color: AppColor.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: AppColor.secondaryShade, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColor.secondaryShade,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
