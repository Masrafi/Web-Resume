import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/utils/app_divider.dart';

import '../../../utils/app_text_style.dart';
import '../bloc/edu_bloc.dart';
import '../bloc/edu_state.dart';
import '../model/edu_model.dart';

class EduScreen extends StatelessWidget {
  const EduScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EduBloc, EduState> (
               builder: (context, state) {
                 if(state is EduLoaded) {
                   List<EduModel> data = state.mydata;
                   return ListView.builder(
                   padding: EdgeInsets.only(top: 30),
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       // Row(
                       //   children: [
                       //     Text('Degree', style: AppTextStyle.introTextStyle(),),
                       //     Text('Major Subject / group', style: AppTextStyle.introTextStyle(),),
                       //     Text('Institution', style: AppTextStyle.introTextStyle(),),
                       //     Text('Grade/ CGPA', style: AppTextStyle.introTextStyle(),),
                       //     Text('Passing Year', style: AppTextStyle.introTextStyle(),),
                       //    
                       //   ],
                       // ),
                       AppDividerBlack(),
                       SizedBox(height: 5,),
                       Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           AppDividerWid(),
                           Expanded(child: Text(data[index].degree, style: index == 0 ? AppTextStyle.introTextStyle():TextStyle(),)),
                           AppDividerWid(),
                           Expanded(child: Text(data[index].group, style: index == 0 ? AppTextStyle.introTextStyle():TextStyle(),)),
                           AppDividerWid(),
                           Expanded(child: Text(data[index].institution, style: index == 0 ? AppTextStyle.introTextStyle():TextStyle(),)),
                           AppDividerWid(),
                           Expanded(child: Text(data[index].grade, style: index == 0 ? AppTextStyle.introTextStyle():TextStyle(),)),
                           AppDividerWid(),
                           Expanded(child: Text(data[index].year, style: index == 0 ? AppTextStyle.introTextStyle():TextStyle(),)),
                           
                         ],
                       ),
                     SizedBox(height: 5,),
                     if (index == data.length -1)
                     AppDividerBlack(),
                       
                     ],
                     );
                   },
                   );
                 } else if(state is EduLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
