import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/utils/frame.dart';
import 'package:resume/utils/show_screen.dart';

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
                     return Frame(
                     alignment: Alignment.topRight,
                     height: 250,
                       width: 650,
                       child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowScreen(title: 'Father Name: ', head: data[index].f_name, style: TextStyle(),),
                              ShowScreen(title: 'Mother Name: ', head: data[index].m_name, style: TextStyle(),),
                              ShowScreen(title: 'Date of Birth: ', head: data[index].d_birth, style: TextStyle(),),
                              ShowScreen(title: 'Gender: ', head: data[index].gender, style: TextStyle(),),
                              ShowScreen(title: 'Nationality: ', head: data[index].nationality, style: TextStyle(),),
                              ShowScreen(title: 'NID: ', head: data[index].nid, style: TextStyle(),),
                              ShowScreen(title: 'Religion: ', head: data[index].religion, style: TextStyle(),),
                              ShowScreen(title: 'Permanent Address: ', head: data[index].a_permanent, style: TextStyle(),),
                              ShowScreen(title: 'Present Address: ', head: data[index].a_persent, style: TextStyle(),),
                            ],
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
