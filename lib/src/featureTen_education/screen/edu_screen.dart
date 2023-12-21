import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(data[index].degree,),
                       Text(data[index].group,),
                       Text(data[index].institution,),
                       Text(data[index].grade,),
                       Text(data[index].year,),
                      
                     
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
