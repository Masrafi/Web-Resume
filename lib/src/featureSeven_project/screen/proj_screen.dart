import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/utils/frame.dart';
import 'package:resume/utils/link_widget.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/constant/app_box_decoration.dart';
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
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Frame(
                     alignment: Alignment.topLeft,
                     height: 100,
                       width: 600,
                       child: SingleChildScrollView(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(data[index].title, style: AppTextStyle.introTextStyle(),),
                             LinkWidget(link:data[index].link, child: Text(data[index].link, style: AppTextStyle.linkTextStyle(),)),
                           ],
                           ),
                       ),
                     );
                   },
                   );
                   
                   // GridView.builder(
                   //       shrinkWrap: true,
                   //        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   //          crossAxisCount: 2,
                   //          mainAxisSpacing: 10.0,
                   //          childAspectRatio: 6,
                   //          //crossAxisSpacing: 10.0,
                   //          ),
                   //      padding: EdgeInsets.zero,
                   //      itemCount: data.length,
                   //       itemBuilder: (_,  index) {
                   //   return Frame(
                   //   alignment: Alignment.topLeft,
                   //   height: 100,
                   //     width: 600,
                   //     child: SingleChildScrollView(
                   //       child: Column(
                   //         mainAxisAlignment: MainAxisAlignment.start,
                   //         crossAxisAlignment: CrossAxisAlignment.start,
                   //         children: [
                   //           Text(data[index].title, style: AppTextStyle.introTextStyle(),),
                   //           LinkWidget(link:data[index].link, child: Text(data[index].link, style: AppTextStyle.linkTextStyle(),)),
                   //         ],
                   //         ),
                   //     ),
                   //   );
                   // },
                   // );
                 } else if(state is ProjLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
