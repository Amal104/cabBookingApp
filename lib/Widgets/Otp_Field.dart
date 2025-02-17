import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';
import '../values/values.dart';

Widget textFieldOTP(
    {required bool first,
    required TextEditingController controller,
    required last,
    required BuildContext context,
    required LoginProvider provider}) {
  return SizedBox(
    height: height(context) * 0.1,
    child: AspectRatio(
      aspectRatio: 0.85,
      child: TextField(
        controller: controller,
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
          provider.isFourOtp();
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.secondaryShade,
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0, color: AppColor.secondaryShade),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: AppColor.primary),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
  );
}
