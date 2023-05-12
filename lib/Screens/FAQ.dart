import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Screens/Support.dart';
import '../Components/AppBar.dart';
import '../Widgets/PageTitle.dart';
import '../values/values.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "FAQ", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.3,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
            vertical: height(context) * 0.02,
            horizontal: width(context) * 0.03),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(
              () => const SupportScreen(),
              transition: Transition.rightToLeft,
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: height(context) * 0.02),
              width: width(context),
              padding: EdgeInsets.symmetric(
                  vertical: height(context) * 0.016,
                  horizontal: width(context) * 0.04),
              decoration: BoxDecoration(
                color: AppColor.secondaryShadev2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Book taSki",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: 25,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
