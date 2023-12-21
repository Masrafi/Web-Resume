import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/proj_bloc.dart';
import '../bloc/proj_state.dart';
import '../model/proj_model.dart';

class ProjScreen extends StatelessWidget {
  const ProjScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjBloc, ProjState> (
               builder: (context, state) {
                 if(state is ProjLoaded) {
                   List<ProjModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(data[index].title,),
                       Text(data[index].link,),
                       
                     
                     ],
                     );
                   },
                   );
                 } else if(state is ProjLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
