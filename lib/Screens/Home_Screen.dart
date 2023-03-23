import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
          height(context) * 0.1,
        ),
        child: CustomAppbar(
          title: Image.asset(
            taSkiBlackLogo,
            height: height(context) * 0.065,
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width(context) * 0.025,
                  vertical: height(context) * 0.013,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 20,
                        color: AppColor.primary,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                ),
              );
            },
          ),
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
      drawer: Drawer(
        backgroundColor: AppColor.secondary,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height(context) * 0.08,
              ),
              Container(
                height: height(context) * 0.2,
                decoration: const BoxDecoration(
                  color: AppColor.secondaryShade,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: height(context) * 0.08,
                      width: width(context) * 0.15,
                      decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: AppColor.secondaryShadev2,
                          size: height(context) * 0.04,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width(context) * 0.3,
                          child: Text(
                            "Dev Akash",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "9996665550",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: AppColor.primary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
