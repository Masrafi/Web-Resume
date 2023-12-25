import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_text_style.dart';
import '../bloc/train_bloc.dart';
import '../bloc/train_state.dart';
import '../model/train_model.dart';
import '../widget/train_widget.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainBloc, TrainState> (
               builder: (context, state) {
                 if(state is TrainLoaded) {
                   List<TrainModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return TrainWidget(num: index+1, title: data[index].title, name: data[index].name, address: data[index].address,);
                   },
                   );
                 } else if(state is TrainLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
