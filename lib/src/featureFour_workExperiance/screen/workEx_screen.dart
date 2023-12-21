import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workEx_bloc.dart';
import '../bloc/workEx_state.dart';
import '../model/workEx_model.dart';

class WorkExScreen extends StatelessWidget {
  const WorkExScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkExBloc, WorkExState> (
               builder: (context, state) {
                 if(state is WorkExLoaded) {
                   List<WorkExModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(data[index].name,),
                       Text(data[index].app_store?? '',),
                       Text(data[index].play_store??'',),
                     ],
                     );
                   },
                   );
                 } else if(state is WorkExLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
