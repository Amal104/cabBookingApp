import 'package:flutter/material.dart';
import 'package:taskiuser/Componants/Colors.dart';
import 'package:taskiuser/Componants/Size.dart';

Widget textFieldOTP(
    {required bool first, required last, required BuildContext context}) {
  return SizedBox(
    height: height(context)*0.1,
    child: AspectRatio(
      aspectRatio: 0.85,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: kWhite,
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryShade,
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: kSecondaryShade),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kPrimary),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
  );
}
