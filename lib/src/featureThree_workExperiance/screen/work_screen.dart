import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/featureThree_workExperiance/widget/show_case.dart';
import 'package:resume/utils/show_screen.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/colors.dart';
import '../bloc/work_bloc.dart';
import '../bloc/work_state.dart';
import '../model/work_model.dart';

class WorkScreen extends StatefulWidget { //data[index].company_name
  const WorkScreen({super.key});   // data[index].responsibilities.a

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkBloc, WorkState> (
               builder: (context, state) {
                 if(state is WorkLoaded) {
                   List<WorkModel> data = state.mydata;
                   return GridView.builder(
                   shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 2.7,
                            //crossAxisSpacing: 10.0,
                            ),
                        padding: EdgeInsets.zero,
                        itemCount: data.length,
                         itemBuilder: (_,  index) {
                     return ShowCase(company_name: data[index].company_name, duration: data[index].duration, position: data[index].position, products: data[index].products, a: data[index].responsibilities.a, b: data[index].responsibilities.b, c: data[index].responsibilities.c, d: data[index].responsibilities.d, e: data[index].responsibilities.e,);
                   },
                   );
                 } else if(state is WorkLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}
