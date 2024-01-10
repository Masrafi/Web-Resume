import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_text_style.dart';
import '../bloc/cer_bloc.dart';
import '../bloc/cer_state.dart';
import '../model/cer_model.dart';

class CerScreen extends StatelessWidget {
  const CerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CerBloc, CerState> (
               builder: (context, state) {
                 if(state is CerLoaded) {
                   List<CerModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15,),
                       SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                         child: Row(
                           children: [
                             Text((index+1).toString(), style: AppTextStyle.introTextStyle(),),
                             Text('. ${data[index].title}', style: AppTextStyle.introTextStyle(),),
                           ],
                         ),
                       ),
                       Text('    ${data[index].discribtion}',),
                       
                     
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
