import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Screens/Airport_TripScreen.dart';
import '../Screens/City_TripScreen.dart';
import '../Screens/Outstation_TripScreen.dart';
import '../Screens/RentalTripScreen.dart';
import '../values/values.dart';

void modalBottomSheetMenu(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await showModalBottomSheet(
        elevation: 0,
        backgroundColor: AppColor.transparent,
        barrierColor: AppColor.transparent,
        enableDrag: false,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        builder: (builder) {
          return DefaultTabController(
            length: 4,
            child: SizedBox(
              height: height(context) * 0.55,
              child: Column(
                children: [
                  Container(
                    height: height(context) * 0.06,
                    width: width(context),
                    decoration: const BoxDecoration(
                      color: AppColor.secondaryShadev2,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20),
                      ),
                    ),
                    child: TabBar(
                        indicatorWeight: 3.5,
                        indicatorPadding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.015,
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
                                  FontAwesomeIcons.city,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: width(context) * 0.01,
                                ),
                                const Text("City"),
                              ],
                            ),
                          ),
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
                    child: SizedBox(
                      width: width(context),
                      child: const TabBarView(children: [
                        CityTripScreen(),
                        AirportTripScreen(),
                        OutstationTripScreen(),
                        RentalTripScreen(),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  });
}
