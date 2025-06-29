import 'package:flutter/material.dart';
import 'package:resume/src/featureFour_workExperiance/widget/link_open.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_text_style.dart';

class LinkWidget extends StatelessWidget {
  const LinkWidget({super.key, required this.child, required this.link});
    final link;
    final child;
    @override
    Widget build(BuildContext context) {
      return GestureDetector(
       child: child,
         onTap: () async{
          LinkOpen.onClickAction(link);
         },
       );
    }
  }