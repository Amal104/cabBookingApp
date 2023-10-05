import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';
import 'package:taskiuser/Screens/Home_Screen.dart';
import 'package:taskiuser/Widgets/LogOut_Button.dart';
import 'package:taskiuser/Widgets/ProfileScreen_Shimmer.dart';
import 'package:taskiuser/Widgets/Profile_Data.dart';
import 'package:taskiuser/values/values.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false)
        .getProfileData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<ProfileProvider>(builder: (context, provider, child) {
            return provider.profile != null
                ? Column(
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
                              padding:
                                  EdgeInsets.only(left: width(context) * 0.02),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: height(context) * 0.05,
                                      decoration: BoxDecoration(
                                        color: AppColor.primary,
                                        borderRadius: BorderRadius.circular(25),
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
                                      height: height(context) * 0.050,
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
                          const LogOutButton(),
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
                        provider.profile?.name ?? "",
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
                        child: ProfileData(
                            profile: provider.profile, provider: provider),
                      ),
                    ],
                  )
                : const ProfileScreenShimmer();
          }),
        ),
      ),
    );
  }
}
