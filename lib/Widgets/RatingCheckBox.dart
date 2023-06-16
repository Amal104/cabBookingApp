
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/values.dart';

class RatingCheckBox extends StatelessWidget {
  const RatingCheckBox({
    super.key,
    this.value,
    required this.title,
    this.function,
  });

  final bool? value;
  final String title;
  final void Function(bool?)? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width(context) * 0.05),
      child: SizedBox(
        height: 50,
        width: width(context) * 0.8,
        child: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: value,
                checkColor: AppColor.black,
                onChanged: function,
              ),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: AppColor.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
