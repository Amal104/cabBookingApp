import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/AppBar.dart';
import '../Widgets/PageTitle.dart';
import '../values/values.dart';
import 'package:signature/signature.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  SignatureController controller = SignatureController();
  @override
  void initState() {
    controller = SignatureController(
      penColor: AppColor.white,
      penStrokeWidth: 2,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "Add signature", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.48,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height(context) * 0.1,
            ),
            Signature(
              controller: controller,
              backgroundColor: AppColor.black,
              height: height(context) * 0.6,
            ),
            SizedBox(
              height: height(context) * 0.06,
            ),
            buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildCheck(context),
        buildClear(),
      ],
    );
  }

  Widget buildCheck(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: AppColor.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.black,
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(4, 4),
              ),
              BoxShadow(
                color: AppColor.grey800,
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(-4, -4),
              )
            ]),
        child: IconButton(
          onPressed: () {
            HapticFeedback.lightImpact();
          },
          icon: const FaIcon(
            FontAwesomeIcons.check,
            color: Colors.green,
          ),
          splashColor: AppColor.transparent,
          highlightColor: AppColor.transparent,
        ),
      );

  Widget buildClear() => Container(
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
              color: AppColor.grey800,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(4, 4),
            )
          ],
        ),
        child: IconButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            controller.clear();
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
