import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/AppBar.dart';
import '../Widgets/PageTitle.dart';
import '../values/values.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "Support", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.37,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
            vertical: height(context) * 0.02,
            horizontal: width(context) * 0.03),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => showModalBottomSheet(
              barrierColor: const Color(0xE3000000),
              backgroundColor: AppColor.transparent,
              context: context,
              builder: (context) => Container(
                height: height(context) * 0.35,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: AppColor.transparent,
                        child: Align(
                          child: Text(
                            "How to book taSki?",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: width(context),
                        color: AppColor.secondaryShade,
                        child: Align(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lorem ipsum dolor sit amet. Sed delectus fuga sit autem ipsam et officiis esse At rerum voluptatem. In deleniti corrupti hic dignissimos officia hic voluptas molestias nam error consequatur! Id Quis velit aut optio inventore eum facere accusamus? Et placeat voluptates id similique aliquam qui repudiandae voluptatem ut praesentium unde.",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                    "How to book taSki?",
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
