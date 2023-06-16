import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/values.dart';

Widget customButton(BuildContext context, String text,
    void Function()? function, double radius,List<BoxShadow>? boxshadow) {
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
