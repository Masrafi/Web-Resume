import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/flu_bloc.dart';
import '../bloc/flu_state.dart';
import '../model/flu_model.dart';

class FluScreen extends StatelessWidget {
  const FluScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FluBloc, FluState> (
               builder: (context, state) {
                 if(state is FluLoaded) {
                   List<FluModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Text(data[index].text,);
                   },
                   );
                 } else if(state is FluLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
