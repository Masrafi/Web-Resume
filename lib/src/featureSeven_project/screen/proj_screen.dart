import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/utils/frame.dart';
import 'package:resume/utils/link_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/constant/app_box_decoration.dart';
import '../bloc/proj_bloc.dart';
import '../bloc/proj_state.dart';
import '../model/proj_model.dart';

class ProjScreen extends StatelessWidget {
  const ProjScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjBloc, ProjState>(
      builder: (context, state) {
        if (state is ProjLoaded) {
          List<ProjModel> data = state.mydata;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              bool isFirst = index == 0;
              bool isLast = index == data.length - 1;
              bool isLeftAligned = index % 2 == 0;

              return TimelineTile(
                alignment: TimelineAlign.center,
                isFirst: isFirst,
                isLast: isLast,
                indicatorStyle: IndicatorStyle(
                  width: 26,
                  color: Colors.blue,
                  iconStyle: IconStyle(
                    iconData: Icons.rocket_launch,
                    color: Colors.white,
                  ),
                ),
                beforeLineStyle: LineStyle(
                  color: Colors.blue.shade400,
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: Colors.blue.shade400,
                  thickness: 2,
                ),
                startChild:
                    isLeftAligned ? _buildProjectCard(data[index]) : null,
                endChild:
                    !isLeftAligned ? _buildProjectCard(data[index]) : null,
              );
            },
          );
        } else if (state is ProjLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildProjectCard(ProjModel model) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: AppTextStyle.introTextStyle(),
            ),
            const SizedBox(height: 8),
            LinkWidget(
              link: model.link,
              child: Text(
                'Open Link',
                style: AppTextStyle.linkTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
