import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../values/values.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hint, this.controller, this.label, this.initialValue});

  final String? hint;
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       onChanged: (value) {
          controller!.text = value;
          print(controller!.text);
        },
        initialValue: initialValue,
        // controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.grey800,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.white,
              width: 2.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          labelText: label,
          labelStyle: GoogleFonts.inter(
            color: const Color(0xFFB4B4B4),
            fontSize: 18,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            fontSize: 15,
            color: AppColor.grey,
          ),
          contentPadding: const EdgeInsets.only(left: 12),
        ),
        style: GoogleFonts.inter(
          color: AppColor.white,
        ),
    );
  }
}
