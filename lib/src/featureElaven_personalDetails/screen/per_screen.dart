import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/widgets/show_screen.dart';

import '../bloc/per_bloc.dart';
import '../bloc/per_state.dart';
import '../model/per_model.dart';

class PerScreen extends StatelessWidget {
  const PerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PerBloc, PerState> (
               builder: (context, state) {
                 if(state is PerLoaded) {
                   List<PerModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Align(
                                                   alignment: Alignment.topRight,
                       child: UnconstrainedBox(
                         child: Container(
                         width: 650,
                         height: 250,
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
                             ShowScreen(title: 'Father Name: ', head: data[index].f_name,),
                             ShowScreen(title: 'Mother Name: ', head: data[index].m_name,),
                             ShowScreen(title: 'Date of Birth: ', head: data[index].d_birth,),
                             ShowScreen(title: 'Gender: ', head: data[index].gender,),
                             ShowScreen(title: 'Nationality: ', head: data[index].nationality,),
                             ShowScreen(title: 'NID: ', head: data[index].nid,),
                             ShowScreen(title: 'Religion: ', head: data[index].religion,),
                             ShowScreen(title: 'Permanent Address: ', head: data[index].a_permanent,),
                             ShowScreen(title: 'Present Address: ', head: data[index].a_persent,),
                          
                           
                           ],
                           ),
                         ),
                       ),
                     );
                   },
                   );
                 } else if(state is PerLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
