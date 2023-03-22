import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../values/values.dart';

class CustomTextField {
  final TextEditingController controller = TextEditingController();

  customTextField(BuildContext context) => Container(
        width: width(context),
        // margin: EdgeInsets.symmetric(horizontal: width(context) * 0.08),
        decoration: BoxDecoration(
          color: const Color(0x0FE7E7E7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InternationalPhoneNumberInput(
          textFieldController: controller,
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
            controller.text = number.phoneNumber!;
          },
          onInputValidated: (bool value) {
            print(value);
          },
          onSaved: (PhoneNumber number) {
            controller.text = number.toString();
          },
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          inputDecoration: InputDecoration(
              hintText: "Enter your mobile number",
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade800,
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
          selectorTextStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlignVertical: TextAlignVertical.center,
          searchBoxDecoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search here",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          countrySelectorScrollControlled: false,
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            showFlags: false,
            setSelectorButtonAsPrefixIcon: true,
            trailingSpace: false,
            leadingPadding: 10,
          ),
        ),
      );
}
