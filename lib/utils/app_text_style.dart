import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle splashStyle() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: DEFAULT_TEXT_COLOR,
      );
  static TextStyle nameStyle() => const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: DEFAULT_TEXT_COLOR,
        );

  static TextStyle highlightsTextStyle() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: TITLECOLOR,
      );
  
  static TextStyle introTextStyle() => const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: DEFAULT_TEXT_COLOR,
        );
   static TextStyle linkTextStyle() => const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: TITLECOLOR,
          );
   static TextStyle aboutTextStyle() => const TextStyle(
               fontSize: 14,
               fontWeight: FontWeight.w600,
               fontStyle: FontStyle.italic,
               color: TITLECOLOR,
             );
  
}
