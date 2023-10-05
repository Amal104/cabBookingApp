
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskiuser/values/values.dart';

class ProfileScreenShimmer extends StatelessWidget {
  const ProfileScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColor.grey800,
        highlightColor: AppColor.grey,
        child: Column(
          children: [
            SizedBox(
              height: height(context) * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width(context) * 0.02),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: height(context) * 0.05,
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius:
                                BorderRadius.circular(25),
                          ),
                        ),
                        Container(
                          width: width(context) * 0.3,
                          height: height(context) * 0.050,
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.chevronLeft,
                              color: AppColor.grey,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.035),
                  height: height(context) * 0.05,
                  width: width(context)*0.3,
                  decoration: BoxDecoration(
                      color: AppColor.grey800,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            SizedBox(
              height: height(context) * 0.04,
            ),
            Container(
              height: height(context) * 0.08,
              width: width(context) * 0.17,
              decoration: BoxDecoration(
                  color: AppColor.grey800,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: AppColor.secondaryShadev2,
                  size: height(context) * 0.042,
                ),
              ),
            ),
            SizedBox(
              height: height(context) * 0.015,
            ),
            SizedBox(
              height: height(context) * 0.8,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                  child: Container(
                    height: height(context) * 0.06,
                    width: width(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }
}
