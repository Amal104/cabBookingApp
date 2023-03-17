import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:taskiuser/Constants/Colors.dart';
import 'package:taskiuser/Constants/Strings.dart';
import 'package:taskiuser/Screens/Home_Screen.dart';
import 'package:taskiuser/Screens/Otp_Screen.dart';
import '../Constants/Buttons.dart';
import '../Constants/Size.dart';
import '../Constants/TextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String countryCode = "";
    return Scaffold(
      body: SafeArea(
        child: Form(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height(context) * 0.05,
              ),
              Align(
                child: Image.asset(
                  taSkiWhiteLogo,
                  height: height(context) * 0.15,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width(context) * 0.03),
                child: const Text(
                  "MobileNumber",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: height(context) * 0.01,
              ),
              Container(
                width: width(context),
                padding:
                    EdgeInsets.symmetric(horizontal: width(context) * 0.03),
                decoration: BoxDecoration(
                  color: kSecondaryShade,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IntlPhoneField(
                  controller: controller,
                  showCountryFlag: false,
                  initialCountryCode: "IN",
                  onChanged: (value) {
                    countryCode = value.countryCode;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  autovalidateMode: AutovalidateMode.disabled,
                  disableLengthCheck: true,
                  dropdownTextStyle: TextStyle(
                    fontSize: 18,
                    color: kWhite,
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: kWhite,
                  ),
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownIcon: const Icon(Icons.arrow_drop_down_outlined),
                  pickerDialogStyle: PickerDialogStyle(
                    backgroundColor: const Color(0xFF141414),
                    countryCodeStyle: TextStyle(
                      color: kPrimary,
                    ),
                    countryNameStyle: TextStyle(
                      color: kWhite,
                    ),
                    searchFieldInputDecoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search here..",
                      hintStyle: TextStyle(
                        color: kWhite,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: kPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height(context) * 0.03,
              ),
              customButton(context, "Get OTP", () {
                print(countryCode + controller.text);
                Get.to(() => const OtpScreen());
              }),
            ],
          ),
        )),
      ),
    );
  }
}
