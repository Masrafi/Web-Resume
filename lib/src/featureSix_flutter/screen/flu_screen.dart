import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/app_divider.dart';
import '../../../widgets/app_text_style.dart';
import '../bloc/flu_bloc.dart';
import '../bloc/flu_state.dart';
import '../model/flu_model.dart';

class FluScreen extends StatelessWidget {
  const FluScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FluBloc, FluState> (
               builder: (context, state) {
                 if(state is FluLoaded) {
                   List<FluModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Align(
                       alignment: Alignment.topLeft,
                       child: UnconstrainedBox(
                         child: Container(
                         width: 650,
                         height: 900,
                         margin: EdgeInsets.only(bottom: 15),
                         padding: EdgeInsets.all(15),
                         decoration: BoxDecoration(
                         //border: Border.all(),
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                               BoxShadow(
                                 color: Colors.black
                                     .withOpacity(0.03),
                                 spreadRadius: 1,
                                 blurRadius: 5,
                                 offset: Offset(0,
                                     0), // changes position of shadow
                               ),
                             ],
                                            ),
                           child: Column(
                             children: [
                               Row(
                               children: [
                                  Expanded(flex:3,child: Text('Language', style: AppTextStyle.introTextStyle(),)),
                                              Expanded(flex:10,child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(data[index].language.f1,),
                                                  Text(data[index].language.f2,),
                                                ],
                                              )),
                               ],
                               ),
                             SizedBox(height: 10,),
                             AppDivider(),
                             SizedBox(height: 10,),
                             Row(
                               children: [
                                  Expanded(flex:3,child: Text('Flutter', style: AppTextStyle.introTextStyle(),)),
                                  Expanded(flex:10,child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data[index].flutter.f1,),
                                      Text(data[index].flutter.f2,),
                                      Text(data[index].flutter.f3,),
                                      Text(data[index].flutter.f4,),
                                      Text(data[index].flutter.f5,),
                                      Text(data[index].flutter.f6,),
                                      Text(data[index].flutter.f7,),
                                      Text(data[index].flutter.f8,),
                                      Text(data[index].flutter.f9,),
                                      Text(data[index].flutter.f10,),
                                      Text(data[index].flutter.f11,),
                                      Text(data[index].flutter.f12,),                                            
                                    ],
                                  )),
                               ],
                               ),
                             SizedBox(height: 10,),
                            AppDivider(),
                            SizedBox(height: 10,),
                             Row(
                                    children: [
                                       Expanded(flex:3,child: Text('Swift', style: AppTextStyle.introTextStyle(),)),
                                       Expanded(flex:10,child: Text(data[index].swift,)),
                                    ],
                                    ),
                             SizedBox(height: 10,),
                            AppDivider(),
                            SizedBox(height: 10,),
                             Row(
                                        children: [
                                           Expanded(flex:3,child: Text('Database', style: AppTextStyle.introTextStyle(),)),
                                           Expanded(flex:10,child: Text(data[index].database,)),
                                        ],
                                        ),
                             SizedBox(height: 10,),
                            AppDivider(),
                            SizedBox(height: 10,),
                             Row(
                                        children: [
                                           Expanded(flex:3,child: Text('Third Party', style: AppTextStyle.introTextStyle(),)),
                                           Expanded(flex:10,child: Text(data[index].t_party,)),
                                        ],
                                        ),
                             SizedBox(height: 10,),
                              AppDivider(),
                              SizedBox(height: 10,),
                             Row(
                                 children: [
                                    Expanded(flex:3,child: Text('IDE', style: AppTextStyle.introTextStyle(),)),
                                    Expanded(flex:10,child: Text(data[index].ide,)),
                                 ],
                                 ),
                             SizedBox(height: 10,),
                            AppDivider(),
                            SizedBox(height: 10,),
                             Row(
                                 children: [
                                    Expanded(flex:3,child: Text('App for Work', style: AppTextStyle.introTextStyle(),)),
                                    Expanded(flex:10,child: Text(data[index].a_work,)),
                                 ],
                                 ),
                             SizedBox(height: 10,),
                            AppDivider(),
                            SizedBox(height: 10,),
                             Row(
                                  children: [
                                     Expanded(flex:3,child: Text('Team Participant', style: AppTextStyle.introTextStyle(),)),
                                     Expanded(flex:10,child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(data[index].team_par.f1,),
                                         Text(data[index].team_par.f2,),
                                         Text(data[index].team_par.f3,),
                                       ],
                                     )),
                                  ],
                                  ),
                             SizedBox(height: 10,),
                            AppDivider(),
                            SizedBox(height: 10,),
                             Row(
                                    children: [
                                       Expanded(flex:3,child: Text('Project Management', style: AppTextStyle.introTextStyle(),)),
                                       Expanded(flex:10,child: Text(data[index].pro_manag,)),
                                    ],
                                 ),
                             SizedBox(height: 10,),
                              AppDivider(),
                              SizedBox(height: 10,),
                             Row(
                                     children: [
                                        Expanded(flex:3,child: Text('Software Development Methodologies', style: AppTextStyle.introTextStyle(),)),
                                        Expanded(flex:10,child: Text(data[index].sof_metho,)),
                                     ],
                                     ), 
                             SizedBox(height: 10,),
                              AppDivider(),
                              SizedBox(height: 10,),
                             Row(
                                   children: [
                                      Expanded(flex:3,child: Text('Others', style: AppTextStyle.introTextStyle(),)),
                                      Expanded(flex:10,child: Text(data[index].other)),
                                   ],
                                   ), 
                             SizedBox(height: 10,),
                             AppDivider(),                                                                                                                                                                                                                         
                             ],
                           ),
                         ),
                       ),
                     );
                   },
                   );
                 } else if(state is FluLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
