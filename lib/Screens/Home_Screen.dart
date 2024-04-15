import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskiuser/Components/AppBar.dart';
import 'package:taskiuser/Components/Toast.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import 'package:taskiuser/Screens/City_TripScreen.dart';
import 'package:taskiuser/Screens/Home_Drawer.dart';
import 'package:taskiuser/Screens/WhereToGo.dart';
import 'package:taskiuser/Widgets/BottomSheet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taskiuser/Widgets/test.dart';
import '../Widgets/HomeBottomSheet.dart';
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
      child: Consumer<BookingProvider>(
        builder: (context, provider, child) => DefaultTabController(
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
            // bottomSheet: const WhereToGoPage(),
            body: Stack(
              children: [
                const GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(9.931233, 76.267303), zoom: 14.5),
                ),
                DraggableScrollableSheet(
                  minChildSize: 0.3,
                  initialChildSize: 0.4,
                  maxChildSize: 0.5,
                  builder: (context, scrollController) {
                    if (provider.whereToGo == false) {
                      return const WhereToGoPage();
                    } else {
                      return const CityTripScreen();
                    }
                  },
                )
              ],
            ),
            // bottomSheet: const WhereToGoPage(),
            drawer: const HomeScreenDrawer(),
          ),
        ),
      ),
    );
  }
}
