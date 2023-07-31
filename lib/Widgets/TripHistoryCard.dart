
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/values.dart';

class TripHistoryCard extends StatelessWidget {
  const TripHistoryCard({
    super.key,
    required this.title,
    required this.tripType,
    required this.paymentType,
  });

  final String title;
  final String tripType;
  final String paymentType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width(context) * 0.04,
        vertical: height(context) * 0.01,
      ),
      height: height(context) * 0.3,
      width: width(context),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: width(context),
              decoration: const BoxDecoration(
                color: AppColor.secondaryShadev2,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width(context) * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.005,
                        ),
                        Text(
                          tripType,
                          style: GoogleFonts.inter(
                            color: AppColor.primary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          paymentType,
                          style: GoogleFonts.inter(
                            color: AppColor.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: width(context) * 0.05,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColor.primary,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: width(context),
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Image.asset(
                  "assets/images/map.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
