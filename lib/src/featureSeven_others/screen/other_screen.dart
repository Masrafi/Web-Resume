import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/show_screen.dart';
import '../bloc/other_bloc.dart';
import '../bloc/other_state.dart';
import '../model/other_model.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherBloc, OtherState> (
               builder: (context, state) {
                 if(state is OtherLoaded) {
                   List<OtherModel> data = state.mydata;
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
                            height: 400,
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
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             ShowScreen(title: 'Swift: ', head: data[index].swift, style: TextStyle(),),
                             ShowScreen(title: 'Database: ', head: data[index].database, style: TextStyle(),),
                             ShowScreen(title: 'Third Party: ', head: data[index].third_party, style: TextStyle(),),
                             ShowScreen(title: 'IDE: ', head: data[index].ide, style: TextStyle(),),
                             ShowScreen(title: 'App for Work: ', head: data[index].app_work, style: TextStyle(),),
                             ShowScreen(title: 'Team Participant: ', head: data[index].team_prac, style: TextStyle(),),
                             ShowScreen(title: 'Project Management: ', head: data[index].pro_manag, style: TextStyle(),),
                             ShowScreen(title: 'Software Development Methodologies: ', head: data[index].sof_metho, style: TextStyle(),),
                             ShowScreen(title: 'Others: ', head: data[index].others, style: TextStyle(),),
                             
                           ],
                           ),
                         ),
                       ),
                     );
                   },
                   );
                 } else if(state is OtherLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               ) ;
  }
}
