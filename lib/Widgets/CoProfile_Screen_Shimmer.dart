
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskiuser/values/values.dart';

class CoProfileScreenShimmer extends StatelessWidget {
  const CoProfileScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColor.grey800,
        highlightColor: AppColor.grey,
        child: SizedBox(
          height: height(context),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: width(context),
                    height: height(context) * 0.05,
                    decoration: BoxDecoration(
                        color: AppColor.secondaryShadev2,
                        borderRadius: BorderRadius.circular(8)),
                  )),
        ));
  }
}
