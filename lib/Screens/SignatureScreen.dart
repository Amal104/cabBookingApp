import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/AppBar.dart';
import 'package:taskiuser/Components/Buttons.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';
import 'package:taskiuser/Screens/Profile_Signature_Screen.dart';
import 'package:taskiuser/Widgets/PageTitle.dart';
import 'package:taskiuser/values/values.dart';

class SignatureScreen extends StatelessWidget {
  const SignatureScreen({super.key, required this.signature});

  final String signature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "Signature", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.4,
        ),
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: height(context) * 0.5,
                  width: width(context),
                  color: AppColor.white,
                ),
                Image.network(signature),
              ],
            ),
            SizedBox(
              height: height(context) * 0.05,
            ),
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: width(context) * 0.15),
                  child: CustomButton(
                    context: context,
                    text: "Edit Signature",
                    radius: 30,
                    boxshadow: const [
                      BoxShadow(
                        color: AppColor.black,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(-4, -4),
                      ),
                      BoxShadow(
                        color: AppColor.primary,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      )
                    ],
                    function: () {
                      Get.to(
                        () => const SignatureUpdate(),
                        transition: Transition.zoom,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.05,
                ),
                buildClear(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildClear(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppColor.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColor.black,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(-4, -4),
            ),
            BoxShadow(
              color: AppColor.grey700,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(4, 4),
            )
          ],
        ),
        child: IconButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            Navigator.of(context).pop();
          },
          icon: const FaIcon(
            FontAwesomeIcons.xmark,
            color: Colors.red,
          ),
          splashColor: AppColor.transparent,
          highlightColor: AppColor.transparent,
        ),
      );
}
