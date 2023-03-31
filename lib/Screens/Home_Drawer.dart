import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Screens/My_History_Screen.dart';

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
          Container(
            height: height(context) * 0.2,
            decoration: const BoxDecoration(
              color: AppColor.secondaryShade,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width(context) * 0.3,
                      child: Text(
                        "Dev Akash",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.w600,
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
                        leading: const FaIcon(
                          FontAwesomeIcons.paypal,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Payments',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.location_on_outlined,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Notification',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.alarm,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'FAQ',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.groups_outlined,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Favourites',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.cloud_download_outlined,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Book a trip',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.password_outlined,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Chat Support',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.logout_outlined,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'About Us',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.logout_outlined,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Terms & Conditions',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.logout_outlined,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Privacy Policy',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
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
                          Icons.logout_outlined,
                          color: AppColor.primary,
                          size: 25,
                        ),
                        title: Text(
                          'Contact Us',
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width(context) * 0.05,
              ),
              width: width(context),
              // height: height(context) * 0.07,
              color: AppColor.black,
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
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
