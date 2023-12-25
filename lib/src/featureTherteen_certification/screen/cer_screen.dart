import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/featureTherteen_certification/bloc/cer_bloc.dart';
import 'package:resume/src/featureTherteen_certification/bloc/cer_state.dart';
import 'package:resume/src/featureTherteen_certification/model/cer_model.dart';

import '../../../utils/app_text_style.dart';

class CertScreen extends StatelessWidget {
  const CertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertBloc, CertState> (
               builder: (context, state) {
                 if(state is CerLoaded) {
                   List<CertModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(data[index].title, ),
                       SizedBox(height: 20,),
                       Text(data[index].name, style: AppTextStyle.introTextStyle(),),
                     
                     ],
                     );
                   },
                   );
                 } else if(state is CerLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
