import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/AppBar.dart';
import '../Widgets/PageTitle.dart';
import '../values/values.dart';

class UpcomingTripDetails extends StatelessWidget {
  const UpcomingTripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.132),
        child: CustomAppbarPage(
          title: null,
          leading: const PageTitle(title: "Trip Details", padding: 0),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.42,
          bottom: null,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height(context) * 0.3,
            color: AppColor.grey,
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: AppColor.secondary,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.03,
                    vertical: height(context) * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apr 04 2023 06:42",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.02,
                            vertical: height(context) * 0.008,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.secondaryShade,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Approver",
                            style: GoogleFonts.inter(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.015,
                    ),
                    Row(
                      children: [
                        Radio(
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          value: 0,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                        Text(
                          "Edapplly, Kerala, India",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          value: 1,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                        Text(
                          "Kakkanad, Kakkanad, Kerala, India",
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColor.grey,
                      thickness: 0.5,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: height(context) * 0.08,
            color: AppColor.primary,
          ),
        ],
      ),
    );
  }
}
