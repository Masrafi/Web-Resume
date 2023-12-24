import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/app_text_style.dart';
import '../../../widgets/constant/app_box_decoration.dart';
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
                   return GridView.builder(
                         shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 6,
                            //crossAxisSpacing: 10.0,
                            ),
                        padding: EdgeInsets.zero,
                        itemCount: data.length,
                         itemBuilder: (_,  index) {
                     return Align(
                       alignment: Alignment.topLeft,
                       child: UnconstrainedBox(
                         child: Container(
                         width: 600,
                         height: 100,
                         //margin: EdgeInsets.only(bottom: 15),
                         padding: EdgeInsets.all(15),
                         decoration: AppBoxDecoration.commonDecoration,
                           child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(data[index].title, style: AppTextStyle.introTextStyle(),),
                             Text(data[index].link,),
                             
                           
                           ],
                           ),
                         ),
                       ),
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
