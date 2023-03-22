import 'package:flutter/material.dart';
import 'package:taskiuser/Components/AppBar.dart';
import 'package:taskiuser/Widgets/BottomSheet.dart';

import '../values/values.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // modalBottomSheetMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          width(context),
          height(context) * 0.07,
        ),
        child: CustomAppbar(
          title: Image.asset(taSkiBlackLogo, height: height(context) * 0.06),
          leading: null,
          actions: null,
          color: AppColor.transparent,
          elevation: 0,
        ),
      ),
      bottomSheet: SizedBox(
        height: height(context) * 0.4,
        child: Column(
          children: [
            Expanded(
              child: Container(
                // height: height(context) * 0.4,
                width: width(context),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                      topEnd: Radius.circular(20),
                    ),
                    color: AppColor.secondaryShadev2),
              ),
            ),
            Expanded(
              child: Container(
                // height: height(context) * 0.4,
                width: width(context),
                decoration: const BoxDecoration(color: AppColor.secondary),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
