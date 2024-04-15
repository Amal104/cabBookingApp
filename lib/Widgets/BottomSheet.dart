import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskiuser/Components/Toast.dart';
import 'package:taskiuser/Screens/WhereToGo.dart';
import '../values/values.dart';

void modalBottomSheetMenu(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) async {
      await showModalBottomSheet<dynamic>(
        barrierColor: AppColor.transparent,
        elevation: 0,
        isScrollControlled: false,
        isDismissible: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          DateTime lastTimeBackbuttonWasClicked = DateTime.now();
          return WillPopScope(
            onWillPop: () async {
              if (DateTime.now().difference(lastTimeBackbuttonWasClicked) >=
                  const Duration(seconds: 2)) {
                showCustomToast(
                    context, "Press the back button again to go back");
                lastTimeBackbuttonWasClicked = DateTime.now();
                return false;
              } else {
                SystemNavigator.pop();
              }
              return false;
            },
            // child: SizedBox(
            //   height: height(context)*0.4,
            //   child: Column(
            //     children: [
            //       Container(
            //         decoration: const BoxDecoration(
            //             color: AppColor.secondaryShadev2,
            //             borderRadius:
            //                 BorderRadius.vertical(top: Radius.circular(18))),
            //         child: TabBar(
            //             controller: tabController,
            //             indicatorWeight: 3.5,
            //             indicatorPadding: EdgeInsets.symmetric(
            //                 horizontal: width(context) * 0.010,
            //                 vertical: height(context) * 0.002),
            //             labelPadding: EdgeInsets.zero,
            //             padding: EdgeInsets.zero,
            //             labelColor: AppColor.white,
            //             unselectedLabelColor: AppColor.grey700,
            //             tabs: [
            //               Tab(
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     const FaIcon(
            //                       FontAwesomeIcons.planeDeparture,
            //                       size: 12,
            //                     ),
            //                     SizedBox(
            //                       width: width(context) * 0.01,
            //                     ),
            //                     const Text("Airport"),
            //                   ],
            //                 ),
            //               ),
            //               Tab(
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     const FaIcon(
            //                       FontAwesomeIcons.car,
            //                       size: 12,
            //                     ),
            //                     SizedBox(
            //                       width: width(context) * 0.01,
            //                     ),
            //                     const Text("Outstation"),
            //                   ],
            //                 ),
            //               ),
            //               Tab(
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     const FaIcon(
            //                       FontAwesomeIcons.solidClock,
            //                       size: 12,
            //                     ),
            //                     SizedBox(
            //                       width: width(context) * 0.01,
            //                     ),
            //                     const Text("Rental"),
            //                   ],
            //                 ),
            //               ),
            //             ]),
            //       ),
            //       Expanded(
            //         child:
            //             TabBarView(controller: tabController, children: const [
            //           CityTripScreen(),
            //           CityTripScreen(),
            //           CityTripScreen(),
            //         ]),
            //       )
            //     ],
            //   ),
            // ),
            child: const WhereToGoPage(),
          );
        },
      );
    },
  );
}
