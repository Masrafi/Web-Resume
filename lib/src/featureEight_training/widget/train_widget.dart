import 'package:flutter/material.dart';

import '../../../utils/app_text_style.dart';

class TrainWidget extends StatelessWidget {
  const TrainWidget({super.key, required this.num, required this.title, required this.name, required this.address});
  final int num;
  final title;
  final name;
  final address;

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Row(
                children: [
                  Text((num).toString(), style: AppTextStyle.introTextStyle(),),
                  Text('. ${title}', style: AppTextStyle.introTextStyle(),),
                ],
              ),
              Text('    ${name}', ),
              Text('    ${address}', ),
             
            ],
            );
  }
}
