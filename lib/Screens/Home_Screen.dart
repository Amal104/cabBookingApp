import 'package:flutter/material.dart';
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
      bottomSheet: Container(
        height: height(context)*0.4,
        width: width(context),
        decoration: const BoxDecoration(
          color: AppColor.secondaryShade
        ),
      ) ,
      body: Column(
        children: [],
      ),
    );
  }
}
