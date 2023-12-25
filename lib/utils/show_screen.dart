import 'package:flutter/material.dart';

import 'app_text_style.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({super.key, required this.title, required this.head, required this.style});
    final head;
    final title;
    final style;
    @override
    Widget build(BuildContext context) {
      return Row(
           children: [
             Expanded(flex:3,child: Text('${title}', style: AppTextStyle.introTextStyle(),)),
             Expanded(flex:10,child: Align(alignment: Alignment.topLeft, child: Text(head, style: style,))),
          ],
       );
    }
  }
