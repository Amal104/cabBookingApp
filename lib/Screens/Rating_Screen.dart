import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/Buttons.dart';
import 'package:taskiuser/Components/FlushBar.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import '../Widgets/RatingCheckBox.dart';
import '../values/values.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Consumer<BookingProvider>(
          builder: (context, provider, child) => Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height(context)*0.08),
                child: SizedBox(
                  height: height(context),
                  width: width(context),
                  child: Image.asset(
                    "assets/images/ticket.PNG",
                    color: AppColor.secondaryShadev2,
                  ),
                ),
              ),
              Positioned(
                top: height(context)*0.075,
                right: width(context)*0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: height(context)*0.05,
                    width: width(context)*0.1,
                    decoration: const BoxDecoration(
                        color: AppColor.black, shape: BoxShape.circle),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // top: height(context)*0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height(context) * 0.06,
                    ),
                    Text(
                      "Corporate Credit",
                      style: GoogleFonts.inter(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary,
                      ),
                    ),
                    Text(
                      "Corporate Credit",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColor.primary,
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Container(
                      height: 2,
                      width: width(context) * 0.67,
                      decoration: BoxDecoration(
                        color: AppColor.grey800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/user.jpg"),
                          radius: 35,
                        ),
                        SizedBox(
                          width: width(context) * 0.025,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dev Akash",
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),
                            ),
                            Text(
                              "Rate Your Ride",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: const Color.fromARGB(255, 139, 139, 139),
                              ),
                            ),
                            RatingBar.builder(
                              itemSize: 30,
                              glowRadius: 1,
                              initialRating: 3.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                provider.starRatingData(rating);
                                if (kDebugMode) {
                                  print(provider.starRating);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context) * 0.05,
                    ),
                    RatingCheckBox(
                      title: "Great Conversation",
                      function: (value) => provider.ratingValue1Data(value),
                      value: provider.ratingCheckBoxValue1,
                    ),
                    RatingCheckBox(
                      title: "Good behaviour",
                      function: (value) => provider.ratingValue2Data(value),
                      value: provider.ratingCheckBoxValue2,
                    ),
                    RatingCheckBox(
                      title: "Driver was on time for pickup",
                      function: (value) => provider.ratingValue3Data(value),
                      value: provider.ratingCheckBoxValue3,
                    ),
                    RatingCheckBox(
                      title: "Would like to ride with him again",
                      function: (value) => provider.ratingValue4Data(value),
                      value: provider.ratingCheckBoxValue4,
                    ),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    Container(
                      height: 2,
                      width: width(context) * 0.67,
                      decoration: BoxDecoration(
                        color: AppColor.grey800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width(context) * 0.15),
                      child: customButton(
                        context,
                        "Rate Your Trip",
                        () {
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pop();
                          CustomFlushBar.customFlushBar(
                            context,
                            "Hey Akash",
                            "Thank you for your rating",
                          );
                        },
                        5,
                        const [
                          BoxShadow(
                            color: AppColor.black,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                          BoxShadow(
                            color: AppColor.grey800,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4, 4),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
