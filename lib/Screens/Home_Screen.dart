import 'package:flutter/material.dart';
import 'package:taskiuser/Components/AppBar.dart';
import 'package:taskiuser/Screens/Home_Drawer.dart';

import '../Widgets/HomeBottomSheet.dart';
import '../values/values.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
              height: height(context) * 0.07,
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.025,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.secondary,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.menu,
                          size: 25,
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
            leadingWidth: width(context)*0.16,
          ),
        ),
        bottomSheet: const HomeBottomSheet(),
        body: const Column(
          children: [],
        ),
        drawer: const HomeScreenDrawer(),
      ),
    );
  }
}
