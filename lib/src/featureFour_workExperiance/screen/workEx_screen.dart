import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/utils/frame.dart';
import 'package:resume/utils/link_widget.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/show_screen.dart';
import '../bloc/workEx_bloc.dart';
import '../bloc/workEx_state.dart';
import '../model/workEx_model.dart';
import 'package:soft_container/soft_container.dart';

class WorkExScreen extends StatelessWidget {
  const WorkExScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkExBloc, WorkExState>(
      builder: (context, state) {
        if (state is WorkExLoaded) {
          List<WorkExModel> data = state.mydata;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (_, index) {
              return SoftContainer(
                alignment: Alignment.topLeft,
                borderRadius: 20,
                width: 650,
                height: 150,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowScreen(
                        title: 'Name: ',
                        head: data[index].name,
                        style: TextStyle(),
                      ),
                      LinkWidget(
                          link: data[index].app_store,
                          child: ShowScreen(
                              title: 'App Store Link: ',
                              head: data[index].app_store,
                              style: AppTextStyle.linkTextStyle())),
                      LinkWidget(
                          link: data[index].play_store,
                          child: ShowScreen(
                              title: 'Play Store Link: ',
                              head: data[index].play_store,
                              style: AppTextStyle.linkTextStyle())),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is WorkExLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
