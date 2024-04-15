import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskiuser/Provider/Booking_Provider.dart';
import 'package:taskiuser/Screens/City_TripScreen.dart';
import 'package:taskiuser/Widgets/CityTrip_Input.dart';
import 'package:taskiuser/Widgets/City_RouteType.dart';
import 'package:taskiuser/values/values.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.provider});

  final BookingProvider provider;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 0.38,
      decoration: const BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColor.secondaryShadev2,
                borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
            child: TabBar(
                controller: tabController,
                indicatorWeight: 3.5,
                indicatorPadding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.010,
                    vertical: height(context) * 0.002),
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                labelColor: AppColor.white,
                unselectedLabelColor: AppColor.grey700,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.planeDeparture,
                          size: 12,
                        ),
                        SizedBox(
                          width: width(context) * 0.01,
                        ),
                        const Text("Airport"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.car,
                          size: 12,
                        ),
                        SizedBox(
                          width: width(context) * 0.01,
                        ),
                        const Text("Outstation"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidClock,
                          size: 12,
                        ),
                        SizedBox(
                          width: width(context) * 0.01,
                        ),
                        const Text("Rental"),
                      ],
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: const [
              CityTripScreen(),
              CityTripScreen(),
              CityTripScreen(),
            ]),
          )
        ],
      ),
    );
  }
}
