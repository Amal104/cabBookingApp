import 'package:flutter/material.dart';
import 'package:taskiuser/Constants/Colors.dart';
import 'package:taskiuser/Widgets/BottomSheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    modalBottomSheetMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Column(
        children: [],
      ),
    );
  }
}
