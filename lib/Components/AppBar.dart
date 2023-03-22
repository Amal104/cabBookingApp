import 'package:flutter/material.dart';
import 'package:taskiuser/values/values.dart';

class CustomAppbar extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;
  final double? elevation;

  const CustomAppbar(
      {super.key,
      required this.title,
      required this.leading,
      required this.actions,
      required this.color,
      required this.elevation});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      centerTitle: true,
      backgroundColor: color,
      actions: actions,
      elevation: elevation,
      automaticallyImplyLeading: false,
    );
  }
}
