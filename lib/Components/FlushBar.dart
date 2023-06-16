import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../values/values.dart';

class CustomFlushBar {
 static customFlushBar(BuildContext context,String title,String msg,) {
    return Flushbar(
      title: title,
      titleColor: AppColor.primary,
      message: msg,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 400),
      backgroundColor: AppColor.black,
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Padding(
        padding: EdgeInsets.all(10.0),
        child: FaIcon(
          FontAwesomeIcons.bell,
          color: AppColor.primary,
        ),
      ),
    ).show(context);
  }
}
