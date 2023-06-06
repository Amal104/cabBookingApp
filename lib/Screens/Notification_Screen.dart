import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Components/AppBar.dart';
import 'package:taskiuser/Widgets/PageTitle.dart';
import '../values/values.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "Notifications", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.45,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
            vertical: height(context) * 0.04,
            horizontal: width(context) * 0.03),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: height(context) * 0.015),
            width: width(context),
            padding: EdgeInsets.symmetric(
                vertical: height(context) * 0.018,
                horizontal: width(context) * 0.04),
            decoration: BoxDecoration(
              color: AppColor.secondaryShadev2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "yaayy 10% OFF on your next booking!!",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                ),
                const FaIcon(
                  FontAwesomeIcons.solidBell,
                  size: 20,
                  color: AppColor.primary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
