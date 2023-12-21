import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(data[index].swift,),
                       Text(data[index].database,),
                       Text(data[index].third_party,),
                       Text(data[index].ide,),
                       Text(data[index].app_work,),
                       Text(data[index].team_prac,),
                       Text(data[index].pro_manag,),
                       Text(data[index].sof_metho,),
                       Text(data[index].others,),
                       
                     ],
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
