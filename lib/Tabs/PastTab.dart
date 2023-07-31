import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Widgets/TripHistoryCard.dart';

import '../Screens/UpcomingTripDetails.dart';
import '../values/values.dart';

class PastTab extends StatelessWidget {
  const PastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
          top: height(context) * 0.04, bottom: height(context) * 0.04),
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => const UpcomingTripDetails(),
              transition: Transition.rightToLeft,
            );
          },
          child: const TripHistoryCard(
            title: "Apr 06, 2023 11:28 AM",
            tripType: "Waiting for approval",
            paymentType: "Credit",
          ),
        );
      },
    );
  }
}
