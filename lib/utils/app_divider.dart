import 'package:flutter/material.dart';
import 'package:resume/utils/app_text_style.dart';
import 'package:resume/utils/colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
           width: double.infinity,
           child: Divider(
             height: .5,
             color: TITLECOLOR,
             thickness: .5,
           ),
         );
  }
}
class AppDividerBlack extends StatelessWidget {
  const AppDividerBlack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
           width: double.infinity,
           child: Divider(
             height: .5,
             color: DEFAULT_TEXT_COLOR,
             thickness: .5,
           ),
         );
  }
}
class AppDividerWid extends StatelessWidget {
  const AppDividerWid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
           height: 30,
           child: VerticalDivider(
            // height: .5,
             
             color: DEFAULT_TEXT_COLOR,
             thickness: 3,
           ),
         );
  }
}