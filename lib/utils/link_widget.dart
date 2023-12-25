import 'package:flutter/material.dart';
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
                      if (await canLaunch(link)) {
                        await launch(link);
                      } else {
                        throw 'Could not launch $link';
                      }
                            
                 },
                 );
      }
    }
