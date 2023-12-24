import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/app_text_style.dart';
import '../bloc/train_bloc.dart';
import '../bloc/train_state.dart';
import '../model/train_model.dart';

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
                     return Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 15,),
                       Row(
                         children: [
                           Text((index+1).toString(), style: AppTextStyle.introTextStyle(),),
                           Text('. ${data[index].title}', style: AppTextStyle.introTextStyle(),),
                         ],
                       ),
                       Text('    ${data[index].name}', ),
                       Text('    ${data[index].address}', ),
                      
                     ],
                     );
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
