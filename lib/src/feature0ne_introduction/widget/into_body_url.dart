import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/app_text_style.dart';

class IntroBodyUrl extends StatelessWidget {
  const IntroBodyUrl({super.key, required this.title, required this.head});
  final head;
  final title;
  @override
  Widget build(BuildContext context) {
    return Row(
         children: [
           Text('${head}: ', style: AppTextStyle.introTextStyle(),),
           GestureDetector(
           child: Text(title),
               onTap: () async{
                    if (await canLaunch(title)) {
                      await launch(title);
                    } else {
                      throw 'Could not launch $title';
                    }
                          
               },
               )
        ],
     );
  }
}
