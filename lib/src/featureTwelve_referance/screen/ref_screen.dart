import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/constant/app_box_decoration.dart';
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
                   return GridView.builder(
                   shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 3.8,
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
                         height: 180,
                         //margin: EdgeInsets.only(bottom: 15),
                         padding: EdgeInsets.all(15),
                         decoration: AppBoxDecoration.commonDecoration,
                           child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(data[index].name,  style: AppTextStyle.introTextStyle(),),
                             Text(data[index].email,),
                             Text(data[index].phone,),
                             Text(data[index].degic,),
                             Text(data[index].organization,),
                           ],
                           ),
                         ),
                       ),
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
