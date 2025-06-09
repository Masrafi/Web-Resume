import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/utils/colors.dart';
import 'package:resume/utils/frame.dart';
import 'package:resume/utils/link_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/show_screen.dart';
import '../bloc/workEx_bloc.dart';
import '../bloc/workEx_state.dart';
import '../model/workEx_model.dart';
import 'package:soft_container/soft_container.dart';

class MyProject extends StatelessWidget {
  const MyProject({super.key});

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
              bool isFirst = index == 0;
              bool isLast = index == data.length - 1;
              return TimelineTile(
                isFirst: isFirst,
                isLast: isLast,
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: TITLECOLOR,
                  iconStyle: IconStyle(
                    iconData: Icons.work,
                    color: Colors.white,
                  ),
                ),
                beforeLineStyle: LineStyle(color: Colors.black, thickness: 2),
                afterLineStyle: LineStyle(color: Colors.black, thickness: 2),
                endChild: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SoftContainer(
                    alignment: Alignment.topLeft,
                    borderRadius: 20,
                    width: 650,
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowScreen(
                          title: 'Name: ',
                          head: data[index].name,
                          style: const TextStyle(),
                        ),
                        data[index].app_store != "Not release"
                            ? LinkWidget(
                                link: data[index].app_store,
                                child: ShowScreen(
                                  title: 'App Store Link: ',
                                  head: data[index].app_store,
                                  style: AppTextStyle.linkTextStyle(),
                                ),
                              )
                            : SizedBox.shrink(),
                        data[index].play_store != "Not release"
                            ? LinkWidget(
                                link: data[index].play_store,
                                child: ShowScreen(
                                  title: 'Play Store Link: ',
                                  head: data[index].play_store,
                                  style: AppTextStyle.linkTextStyle(),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is WorkExLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}
