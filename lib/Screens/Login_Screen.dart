import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taskiuser/Screens/Otp_Screen.dart';
import '../Components/Buttons.dart';
import '../values/values.dart';

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
                  color: AppColor.secondaryShade,
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
                  dropdownTextStyle: const TextStyle(
                    fontSize: 18,
                    color: AppColor.white,
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.white,
                  ),
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownIcon: const Icon(Icons.arrow_drop_down_outlined),
                  pickerDialogStyle: PickerDialogStyle(
                    backgroundColor: const Color(0xFF141414),
                    countryCodeStyle: const TextStyle(
                      color: AppColor.primary,
                    ),
                    countryNameStyle: const TextStyle(
                      color: AppColor.white,
                    ),
                    searchFieldInputDecoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search here..",
                      hintStyle: TextStyle(
                        color: AppColor.white,
                      ),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: AppColor.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height(context) * 0.03,
              ),
              customButton(context, "Get OTP", () {
                HapticFeedback.lightImpact();
                print(countryCode + controller.text);
                Get.off(
                  () => const OtpScreen(),
                  transition: Transition.rightToLeft,
                );
              }),
            ],
          ),
        )),
      ),
    );
  }
}
