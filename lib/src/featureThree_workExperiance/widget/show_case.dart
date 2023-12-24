import 'package:flutter/material.dart';
import 'package:resume/widgets/constant/app_box_decoration.dart';

import '../../../widgets/app_text_style.dart';
import '../../../widgets/show_screen.dart';

class ShowCase extends StatelessWidget {
  final String company_name;
  final String duration;
  final String position;
  final String products;
  final String a;
  final String b;
  final String c;
  final String d;
  final String e;
  const ShowCase({super.key, required this.company_name, required this.duration, required this.position, required this.products, required this.a, required this.b, required this.c, required this.d, required this.e});

  @override
  Widget build(BuildContext context) {
    return Align(
    alignment: Alignment.topLeft,
      child: UnconstrainedBox(
        child: Container(
        width: 600,
        height: 250,
        //margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(15),
        decoration: AppBoxDecoration.commonDecoration,
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               ShowScreen(title: 'Company Name: ', head: company_name),
               ShowScreen(title: 'Duration: ', head: duration),
               ShowScreen(title: 'Position: ', head: position),
               ShowScreen(title: 'Product: ', head: products),
               //ShowScreen(title: 'Responsibility: ', head: data[index].responsibilities.a),
               Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Expanded(flex: 3,child: Text('Responsibility',  style: AppTextStyle.introTextStyle(),)),
                 Expanded(
                 flex: 10,
                   child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(a),
                       Text(b),
                       Text(c),
                       Text(d),
                       Text(e),
                     ],
                   ),
                 ),
                 
               ],
               ),
               //SizedBox(height: 20,),
            ],
          
            ),
          ),
        ),
      ),
    );
  }
}
