import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taskiuser/Components/Buttons.dart';
import '../Components/AppBar.dart';
import '../values/values.dart';
import '../Widgets/PageTitle.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate(
      {super.key,
      required this.type,
      required this.title,
      required this.update,
      required this.isMobile});

  final String type;
  final String title;
  final String update;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: PageTitle(title: title, padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.48,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.09),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height(context) * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                type,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
              ),
            ),
            SizedBox(
              height: height(context) * 0.015,
            ),
            isMobile
                ? Container(
                    width: width(context),
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * 0.03),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryShade,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IntlPhoneField(
                      showCountryFlag: false,
                      initialCountryCode: "IN",
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: update,
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          color: AppColor.grey,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
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
                  )
                : TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: AppColor.secondaryShade,
                      filled: true,
                      hintText: update,
                      hintStyle: GoogleFonts.inter(
                        fontSize: 15,
                        color: AppColor.grey,
                      ),
                      contentPadding: const EdgeInsets.only(left: 12),
                    ),
                    style: GoogleFonts.inter(
                      color: AppColor.white,
                    ),
                  ),
            SizedBox(
              height: height(context) * 0.03,
            ),
            CustomButton(
              context: context,
              text: "UPDATE",
              function: () {
                HapticFeedback.lightImpact();
              },
              radius: 25,
            ),
          ],
        ),
      ),
    );
  }
}
