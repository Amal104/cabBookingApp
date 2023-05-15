import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskiuser/Components/AppBar.dart';
import 'package:taskiuser/Widgets/PageTitle.dart';

import '../Tabs/PastTab.dart';
import '../Tabs/UpcomingTab.dart';
import '../values/values.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height(context) * 0.132),
          child: CustomAppbarPage(
            title: null,
            leading: const PageTitle(title: "My Trips",padding: 0),
            actions: null,
            color: AppColor.transparent,
            elevation: 0,
            leadingWidth: width(context) * 0.38,
            bottom: TabBar(
              padding: EdgeInsets.symmetric(
                horizontal: width(context) * 0.05,
              ),
              labelColor: AppColor.white,
              unselectedLabelColor: AppColor.grey700,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  child: Text(
                    "UPCOMING",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "PAST",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
          UpcomingTab(),
          PastTab(),
        ]),
      ),
    );
  }
}
