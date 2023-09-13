import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/FlushBar.dart';
import 'package:taskiuser/Provider/Profile_Provider.dart';
import 'package:taskiuser/Screens/SignaturePreview.dart';
import '../Components/AppBar.dart';
import '../Widgets/PageTitle.dart';
import '../values/values.dart';
import 'package:signature/signature.dart';

class SignatureUpdate extends StatefulWidget {
  const SignatureUpdate({super.key});

  @override
  State<SignatureUpdate> createState() => _SignatureUpdateState();
}

class _SignatureUpdateState extends State<SignatureUpdate> {
  ProfileProvider? provider;
  @override
  void initState() {
    provider = Provider.of<ProfileProvider>(context, listen: false);
    provider?.signatureController = SignatureController(
      penColor: AppColor.white,
      penStrokeWidth: 2,
    );
    super.initState();
  }

  @override
  void dispose() {
    provider?.signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryShadev2,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: CustomAppbar(
          title: null,
          leading: const PageTitle(title: "Update signature", padding: 14),
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
          leadingWidth: width(context) * 0.55,
        ),
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height(context) * 0.05,
              ),
              Signature(
                controller: provider.signatureController,
                backgroundColor: AppColor.black,
                height: height(context) * 0.65,
              ),
              SizedBox(
                height: height(context) * 0.06,
              ),
              buildButtons(context, provider),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context, ProfileProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildCheck(context, provider),
        buildClear(provider),
      ],
    );
  }

  Widget buildCheck(BuildContext context, ProfileProvider provider) =>
      Container(
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
                color: AppColor.grey700,
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(-4, -4),
              )
            ]),
        child: IconButton(
          onPressed: () async {
            HapticFeedback.lightImpact();
            if (provider.signatureController.isNotEmpty) {
              provider.exportSignature();
              provider.signature = await provider.exportSignature();
              Get.to(() => SignaturePreview(
                    signature: provider.signature,
                  ));
            } else {
              CustomFlushBar.customFlushBar(
                context,
                "Error",
                "Please sign your signature",
              );
            }
          },
          icon: const FaIcon(
            FontAwesomeIcons.check,
            color: Colors.green,
          ),
          splashColor: AppColor.transparent,
          highlightColor: AppColor.transparent,
        ),
      );

  Widget buildClear(ProfileProvider provider) => Container(
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
            provider.signatureController.clear();
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
