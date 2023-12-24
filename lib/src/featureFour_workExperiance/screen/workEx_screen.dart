import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/link_screen.dart';
import '../../../widgets/show_screen.dart';
import '../bloc/workEx_bloc.dart';
import '../bloc/workEx_state.dart';
import '../model/workEx_model.dart';

class WorkExScreen extends StatelessWidget {
  const WorkExScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkExBloc, WorkExState> (
               builder: (context, state) {
                 if(state is WorkExLoaded) {
                   List<WorkExModel> data = state.mydata;
                   return ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:  data.length,
                   itemBuilder: (_, index) {
                     return Align(
                     alignment: Alignment.topLeft,
                       child: UnconstrainedBox(
                         child: Container(
                         width: 650,
                          height: 130,
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                          //border: Border.all(),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                           boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.03),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0,
                                      0), // changes position of shadow
                                ),
                              ],
                        ),
                           child: SingleChildScrollView(
                             child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                             ShowScreen(title: 'Name: ', head: data[index].name,),
                             LinkScreen(title: 'App Store Link: ', head: data[index].app_store,),
                             LinkScreen(title: 'Play Store Link: ', head: data[index].play_store,),
                             ],
                             ),
                           ),
                         ),
                       ),
                     );
                   },
                   );
                 } else if(state is WorkExLoading) {
                   return const Center(child: CircularProgressIndicator(),);
                 } else {
                   return Container();
                 }
               },
               );
  }
}