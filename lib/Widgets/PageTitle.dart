import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/values.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: EdgeInsets.only(left: width(context)*0.02),
        child: Align(
          alignment: Alignment.centerLeft,
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
                      padding: EdgeInsets.only(right: width(context) * 0.05),
                      child: Text(
                        title,
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
    );
  }
}
