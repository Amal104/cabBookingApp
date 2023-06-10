import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';
import 'package:taskiuser/Screens/Home_Screen.dart';
import 'package:taskiuser/Widgets/PageTitle.dart';
import 'package:taskiuser/values/values.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height(context) * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const HomePage(),
                        transition: Transition.leftToRight);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: width(context) * 0.02),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: height(context) * 0.05,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: width(context) * 0.05,
                                    left: width(context) * 0.125),
                                child: Text(
                                  "Profile",
                                  style: GoogleFonts.inter(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
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
                ),
                Padding(
                  padding: EdgeInsets.only(right: width(context) * 0.03),
                  child: Consumer<LoginProvider>(
                    builder: (context, provider, child) => GestureDetector(
                      onTap: () {
                        provider.logout();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.035),
                        height: height(context) * 0.05,
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.rightFromBracket),
                            SizedBox(
                              width: width(context) * 0.02,
                            ),
                            Text(
                              "Logout",
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
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height(context) * 0.04,
            ),
            Hero(
              tag: "Profile",
              child: Container(
                height: height(context) * 0.08,
                width: width(context) * 0.17,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: AppColor.secondaryShadev2,
                    size: height(context) * 0.042,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height(context) * 0.015,
            ),
            Text(
              "Dev Akash",
              style: GoogleFonts.inter(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: height(context) * 0.03,
            ),
            SizedBox(
              width: width(context) * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Name",
                      style: GoogleFonts.inter(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.007,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * 0.05),
                    height: height(context) * 0.065,
                    width: width(context) * 0.8,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dev Akash",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 16,
                          ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColor.primary,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Email",
                      style: GoogleFonts.inter(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.007,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * 0.05),
                    height: height(context) * 0.065,
                    width: width(context) * 0.8,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "amal@taski.in",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 16,
                          ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColor.primary,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Mobile",
                      style: GoogleFonts.inter(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.007,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * 0.05),
                    height: height(context) * 0.065,
                    width: width(context) * 0.8,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "9074145410",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 16,
                          ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColor.primary,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Corporate",
                      style: GoogleFonts.inter(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.007,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.05,
                        vertical: height(context) * 0.015),
                    // height: height(context) * 0.065,
                    width: width(context) * 0.8,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: SvgPicture.asset(
                                "assets/icons/Xiaomi_logo.svg",
                                height: height(context) * 0.05,
                              ),
                            ),
                            SizedBox(
                              width: width(context) * 0.03,
                            ),
                            Text(
                              "MI - Xiaomi",
                              style: GoogleFonts.inter(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColor.primary,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.025,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * 0.05),
                    height: height(context) * 0.065,
                    width: width(context) * 0.8,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Signature",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColor.primary,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
