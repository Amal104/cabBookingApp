import 'package:flutter/material.dart';
import 'package:taskiuser/Components/AppBar.dart';
import 'package:taskiuser/Components/Toast.dart';
import 'package:taskiuser/Screens/Home_Drawer.dart';
import '../Widgets/HomeBottomSheet.dart';
import '../values/values.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime lastTimeBackbuttonWasClicked = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastTimeBackbuttonWasClicked) >=
            const Duration(seconds: 2)) {
          showCustomToast(context, "Press the back button again to go back");
          lastTimeBackbuttonWasClicked = DateTime.now();
          return false;
        } else {
          return true;
        }
      },
      child: DefaultTabController(
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
              leadingWidth: width(context) * 0.16,
            ),
          ),
          bottomSheet: const HomeBottomSheet(),
          body: SizedBox(
            height: height(context)*0.5,
            width: width(context),
              child: Image.asset(
            "assets/images/map.png",
            fit: BoxFit.cover,
          )),
          drawer: const HomeScreenDrawer(),
        ),
      ),
    );
  }
}
