import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/TextField.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import 'package:taskiuser/values/values.dart';

class WhereToGoPage extends StatelessWidget {
  const WhereToGoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<BookingProvider>(
        builder: (context, provider, child) {
          return Container(
            height: height(context) * 0.4,
            decoration: const BoxDecoration(
                color: AppColor.secondary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            provider.whereToGoPage();
                          },
                          child: Container(
                            height: height(context) * 0.06,
                            width: width(context),
                            margin: EdgeInsets.symmetric(
                                horizontal: width(context) * 0.05),
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.primary.withAlpha(150),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "WHERE TO GO?",
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.02,
                        ),
                        Wrap(
                          spacing: width(context) * 0.06,
                          direction: Axis.horizontal,
                          children: [
                            Container(
                              height: height(context) * 0.08,
                              width: width(context) * 0.26,
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.house,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: width(context) * 0.01,
                                  ),
                                  Text(
                                    "Home",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: height(context) * 0.08,
                              width: width(context) * 0.26,
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.suitcase,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: width(context) * 0.01,
                                  ),
                                  Text(
                                    "Work",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: height(context) * 0.08,
                              width: width(context) * 0.26,
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.planeDeparture,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: width(context) * 0.02,
                                  ),
                                  Text(
                                    "Airport\nCOK",
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width(context) * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: height(context) * 0.02,
                                    width: width(context) * 0.04,
                                    decoration: const BoxDecoration(
                                        color: AppColor.white,
                                        shape: BoxShape.circle),
                                  ),
                                  Container(
                                    height: height(context) * 0.013,
                                    width: width(context) * 0.03,
                                    decoration: const BoxDecoration(
                                      color: AppColor.primary,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: width(context)*0.03,),
                              Flexible(
                                child: Text(
                                  dummyAddress1,
                                  style:
                                      GoogleFonts.inter(color: AppColor.white,fontSize: 16,),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width(context) * 0.1),
                            child: Divider(
                                color: AppColor.secondaryShadev2,
                                thickness: 3,
                                height: height(context) * 0.06),
                          ),
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: height(context) * 0.02,
                                    width: width(context) * 0.04,
                                    decoration: const BoxDecoration(
                                        color: AppColor.white,
                                        shape: BoxShape.circle),
                                  ),
                                  Container(
                                    height: height(context) * 0.013,
                                    width: width(context) * 0.03,
                                    decoration: const BoxDecoration(
                                      color: AppColor.primary,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: width(context)*0.03,),
                              Flexible(
                                child: Text(
                                  dummyAddress1,
                                  style:
                                      GoogleFonts.inter(color: AppColor.white,fontSize: 16,),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
