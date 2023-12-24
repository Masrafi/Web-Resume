import 'package:flutter/material.dart';

class AppBoxDecoration {
  static final commonDecoration = BoxDecoration(
      //border: Border.all(),
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
       boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.03),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0,
                  0), // changes position of shadow
            ),
          ],);

  static final customButtonDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 12,
        )
      ]);
}
