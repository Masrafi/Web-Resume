import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/featureThree_workExperiance/widget/show_case.dart';
import 'package:resume/utils/show_screen.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/colors.dart';
import '../bloc/work_bloc.dart';
import '../bloc/work_state.dart';
import '../model/work_model.dart';

class WorkScreen extends StatefulWidget {
  //data[index].company_name
  const WorkScreen({super.key}); // data[index].responsibilities.a

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkBloc, WorkState>(
      builder: (context, state) {
        if (state is WorkLoaded) {
          final data = state.mydata;
          List<Widget> timelineItems = [];
          for (int i = 0; i < data.length; i++) {
            final isFirst = i == 0;
            final isLast = i == data.length - 1;
            final lineXY = i.isEven ? 0.1 : 0.9;
            timelineItems.add(
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: lineXY,
                isFirst: isFirst,
                isLast: isLast,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: i.isEven ? SECONDARY_TEXT_COLOR : PRIMARY_COLOR,
                  padding: const EdgeInsets.all(6),
                ),
                beforeLineStyle: LineStyle(
                  color: i.isEven ? Colors.purple : Colors.cyan,
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: !isLast
                      ? (i.isEven ? Colors.cyan : Colors.purple)
                      : (i.isEven ? Colors.purple : Colors.cyan),
                  thickness: 2,
                ),

                // **Alternate between startChild and endChild to avoid clipping**
                startChild: i.isEven
                    ? null
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShowCase(
                          company_name: data[i].company_name,
                          duration: data[i].duration,
                          position: data[i].position,
                          products: data[i].products,
                          a: data[i].responsibilities.a,
                          b: data[i].responsibilities.b,
                          c: data[i].responsibilities.c,
                          d: data[i].responsibilities.d,
                          e: data[i].responsibilities.e,
                        ),
                      ),
                endChild: i.isEven
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShowCase(
                          company_name: data[i].company_name,
                          duration: data[i].duration,
                          position: data[i].position,
                          products: data[i].products,
                          a: data[i].responsibilities.a,
                          b: data[i].responsibilities.b,
                          c: data[i].responsibilities.c,
                          d: data[i].responsibilities.d,
                          e: data[i].responsibilities.e,
                        ),
                      )
                    : null,
              ),
            );
            if (!isLast) {
              timelineItems.add(
                TimelineDivider(
                  begin: 0.1,
                  end: 0.9,
                  thickness: 2,
                  color: i.isEven ? PRIMARY_COLOR : TITLECOLOR,
                ),
              );
            }
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: timelineItems,
            ),
          );
        } else if (state is WorkLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}
