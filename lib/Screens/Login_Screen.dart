import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/FlushBar.dart';
import 'package:taskiuser/Provider/Login_Provider.dart';
import '../Components/Buttons.dart';
import '../values/values.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // final version = Provider.of<LoginProvider>(context, listen: false);
    // version.fetchVersion(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, provider, child) => SafeArea(
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
                    controller: provider.phonecontroller,
                    showCountryFlag: false,
                    initialCountryCode: "IN",
                    onChanged: (value) {
                      provider.isTenNumber();
                      provider.countryCode = value.countryCode;
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
                GestureDetector(
                  onTap: () {
                    if(provider.isTenNum == false) {
                      HapticFeedback.lightImpact();
                      CustomFlushBar.customFlushBar(context, "Error", "Enter a Valid mobile number");
                    }
                    if (provider.isTenNum) {
                      HapticFeedback.lightImpact();
                      provider.genarateOTP(context);
                    }
                  },
                  child: Container(
                    width: width(context),
                    // margin: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
                    padding:
                        EdgeInsets.symmetric(vertical: height(context) * 0.016),
                    decoration: BoxDecoration(
                      color:
                          provider.isTenNum ? Colors.amber : AppColor.grey800,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [],
                    ),
                    child: Center(
                      child: Text(
                        "Get OTP",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color:
                              provider.isTenNum ? Colors.black : AppColor.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
