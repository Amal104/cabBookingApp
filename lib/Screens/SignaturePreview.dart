import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/Buttons.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';
import 'package:taskiuser/values/values.dart';

class SignaturePreview extends StatelessWidget {
  const SignaturePreview({super.key, required this.signature});

  final Uint8List? signature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.memory(signature!, fit: BoxFit.cover),
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
                    text: "Upload",
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
                      provider.signatureData(context);
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
