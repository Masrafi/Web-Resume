import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/language_bloc.dart';
import '../bloc/language_state.dart';
import '../model/language_model.dart';

class LangauageScreen extends StatelessWidget {
  const LangauageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState> (
               builder: (context, state) {
                 if(state is LanguageLoaded) {
                   List<LanguageModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Text(data[index].text,);
                   },
                   );
                 } else if(state is LanguageLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
