import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/work_bloc.dart';
import '../bloc/work_state.dart';
import '../model/work_model.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkBloc, WorkState> (
               builder: (context, state) {
                 if(state is WorkLoaded) {
                   List<WorkModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(data[index].company_name),
                       Text(data[index].duration),
                       Text(data[index].position),
                       Text(data[index].products),
                       Text(data[index].responsibilities),
                     ],
                     );
                   },
                   );
                 } else if(state is WorkLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
