import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Screens/My_History_Screen.dart';
import 'package:taskiuser/Screens/Notification_Screen.dart';
import 'package:taskiuser/Screens/Payments_Screen.dart';
import 'package:taskiuser/Screens/Profile_Screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../values/values.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.secondary,
      child: Column(
        children: [
          SizedBox(
            height: height(context) * 0.06,
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => const ProfileScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: Container(
              height: height(context) * 0.2,
              decoration: const BoxDecoration(
                color: AppColor.secondaryShade,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: "Profile",
                    child: Container(
                      height: height(context) * 0.07,
                      width: width(context) * 0.15,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width(context) * 0.3,
                        child: Hero(
                          tag: "Name",
                          child: Text(
                            "Dev Akash",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "9996665550",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height(context) * 0.02,
          ),
          Expanded(
            flex: 11,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  Wrap(
                    runSpacing: height(context) * 0.006,
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(
                            () => const MyHistory(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        leading: const FaIcon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'My History',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(
                            () => const PaymentsScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        leading: Image.asset(
                          "assets/icons/rupee.png",
                          height: height(context) * 0.026,
                        ),
                        title: Text(
                          'Payments',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(
                            () => const NotificationScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        leading: const Icon(
                          Icons.notifications,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Notification',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(
                            () => const MyHistory(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        leading: const Icon(
                          Icons.contact_support,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'FAQ',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(
                            () => const MyHistory(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        leading: const Icon(
                          Icons.favorite,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Favourites',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(
                            () => const MyHistory(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        leading: const Icon(
                          Icons.local_taxi,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Book a trip',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(
                            () => const MyHistory(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        leading: const Icon(
                          Icons.question_answer,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Chat Support',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          String googleURL = "https://taski.in/#about";
                          await canLaunchUrlString(googleURL)
                              ? await launchUrlString(
                                  googleURL,
                                  mode: LaunchMode.inAppWebView,
                                )
                              : throw "Could not launch";
                        },
                        leading: const Icon(
                          Icons.info,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'About Us',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          String googleURL = "https://taski.in/terms";
                          await canLaunchUrlString(googleURL)
                              ? await launchUrlString(
                                  googleURL,
                                  mode: LaunchMode.inAppWebView,
                                )
                              : throw "Could not launch";
                        },
                        leading: const Icon(
                          Icons.pages,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Terms & Conditions',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          String googleURL = "https://taski.in/privacy";
                          await canLaunchUrlString(googleURL)
                              ? await launchUrlString(
                                  googleURL,
                                  mode: LaunchMode.inAppWebView,
                                )
                              : throw "Could not launch";
                        },
                        leading: const Icon(
                          Icons.privacy_tip,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Privacy Policy',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          String googleURL = "https://taski.in/#contacts";
                          await canLaunchUrlString(googleURL)
                              ? await launchUrlString(
                                  googleURL,
                                )
                              : throw "Could not launch";
                        },
                        leading: const Icon(
                          Icons.contact_emergency,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Contact Us',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width(context) * 0.05,
                        ),
                        width: width(context),
                        height: height(context) * 0.07,
                        color: AppColor.secondaryShade,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Proudly Indian",
                              style: GoogleFonts.sacramento(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "1.1.22.2",
                              style: GoogleFonts.inter(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
