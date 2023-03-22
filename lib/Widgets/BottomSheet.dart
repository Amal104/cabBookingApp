import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/values.dart';

showbottomsheet(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.6),
      // isScrollControlled: true,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -15,
            child: Container(
              height: 10.0,
              width: 50.0,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
          DraggableScrollableSheet(
            expand: false,
            minChildSize: 0.4,
            initialChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (_, scrollController) => Container(
              color: Colors.transparent,
              child: ListView(
                controller: scrollController,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Hey there..!',
                        style: kmainTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "bottomsheetText",
                      textAlign: TextAlign.justify,
                      style: ksecTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Text(
                      "bottomsheetText",
                      textAlign: TextAlign.justify,
                      style: ksecTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 70),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: const Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  });
}

void modalBottomSheetMenu(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        builder: (builder) {
          return Container(
              height: 350.0,
              decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Column(
                children: [
                  Expanded(child: Text("This is a modal sheet")),
                  Expanded(child: Text("This is a modal sheet")),
                ],
              ));
        });
  });
}
