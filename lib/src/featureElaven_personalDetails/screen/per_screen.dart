import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(data[index].f_name,),
                       Text(data[index].m_name,),
                       Text(data[index].d_birth,),
                       Text(data[index].gender,),
                       Text(data[index].m_status,),
                       Text(data[index].nationality,),
                       Text(data[index].nid,),
                       Text(data[index].religion,),
                       Text(data[index].a_permanent,),
                       Text(data[index].a_persent,),
                       
                     
                     ],
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
