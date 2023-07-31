import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskiuser/Screens/UpcomingTripDetails.dart';
import '../Widgets/TripHistoryCard.dart';
import '../values/values.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
          top: height(context) * 0.04, bottom: height(context) * 0.04),
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(
              () => const UpcomingTripDetails(),
              transition: Transition.rightToLeft,
            );
          },
          child: const TripHistoryCard(
            paymentType: "Credit",
            title: "Apr 06, 2023 11:28 AM",
            tripType: "Waiting for approval",
          ),
        );
      },
    );
  }
}
