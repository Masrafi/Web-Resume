import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/featureTwo_objective/bloc/objective_state.dart';
import 'package:resume/src/featureTwo_objective/model/objective_model.dart';

import '../bloc/objective_bloc.dart';

class ObjectiveScreen extends StatefulWidget {
  const ObjectiveScreen({super.key});

  @override
  State<ObjectiveScreen> createState() => _ObjectiveScreenState();
}

class _ObjectiveScreenState extends State<ObjectiveScreen> {
   
  
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ObjectiveBloc, ObjectiveState> (
    builder: (context, state) {
      if(state is ObjectiveLoaded) {
        List<ObjectiveModel> data = state.mydata;
        return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
        itemCount:  data.length,
        itemBuilder: (_, index) {
          return Text(data[index].title);
        },
        );
      } else if(state is ObjectiveLoading) {
        return const Center(child: CircularProgressIndicator(),);
      } else {
        return Container();
      }
    },
    )
    ;
  }
}
