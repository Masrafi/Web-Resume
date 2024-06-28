import 'package:flutter/material.dart';

import '../../../utils/app_text_style.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key, required this.title, required this.head});
  final head;
  final title;
  @override
  Widget build(BuildContext context) {
    return Row(
         children: [
           Text('${head}: ', style: AppTextStyle.introTextStyle(),),
           Text(title, style: AppTextStyle.linkTextStyle(),),
        ],
     );
  }
}
