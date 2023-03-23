import 'package:flutter/material.dart';
import '../values/values.dart';

customButton(BuildContext context, String text, void Function()? function) =>
    GestureDetector(
      onTap: function,
      child: Container(
        width: width(context),
        // margin: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
        padding: EdgeInsets.symmetric(vertical: height(context) * 0.018),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
