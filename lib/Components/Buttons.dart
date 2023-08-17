import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/values.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.context,
      required this.text,
      this.function,
      required this.radius,
      this.boxshadow});
  final BuildContext context;
  final String text;
  final void Function()? function;
  final double radius;
  final List<BoxShadow>? boxshadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width(context),
        // margin: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
        padding: EdgeInsets.symmetric(vertical: height(context) * 0.016),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: boxshadow,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
