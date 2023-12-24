import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_text_style.dart';

class LinkScreen extends StatelessWidget {
  const LinkScreen({super.key, required this.title, required this.head});
      final head;
      final title;
      @override
      Widget build(BuildContext context) {
        return Row(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Expanded(flex:3,child: Text('${title}', style: AppTextStyle.introTextStyle(),)),
               Expanded(flex:10,child: GestureDetector(
                    child: Text(head, style: AppTextStyle.linkTextStyle(),),
                        onTap: () async{
                             if (await canLaunch(head)) {
                               await launch(head);
                             } else {
                               throw 'Could not launch $title';
                             }
                                   
                        },
                        )),
               
            ],
         );
      }
    }
