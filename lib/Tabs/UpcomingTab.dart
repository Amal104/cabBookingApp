import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/values.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
          top: height(context) * 0.04, bottom: height(context) * 0.04),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: width(context) * 0.04,
            vertical: height(context) * 0.01,
          ),
          height: height(context) * 0.3,
          width: width(context),
          decoration: BoxDecoration(
              color: AppColor.secondaryShade,
              borderRadius: BorderRadius.circular(20)),
        );
      },
    );
  }
}
