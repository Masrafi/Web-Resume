import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ref_bloc.dart';
import '../bloc/ref_state.dart';
import '../model/ref_model.dart';

class RefScreen extends StatelessWidget {
  const RefScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefBloc, RefState> (
               builder: (context, state) {
                 if(state is RefLoaded) {
                   List<RefModel> data = state.mydata;
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
                       Text(data[index].email,),
                       Text(data[index].phone,),
                       Text(data[index].degic,),
                       Text(data[index].organization,),
                     ],
                     );
                   },
                   );
                 } else if(state is RefLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
