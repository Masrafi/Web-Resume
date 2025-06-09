import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../utils/app_text_style.dart';
import '../bloc/train_bloc.dart';
import '../bloc/train_state.dart';
import '../model/train_model.dart';
import '../widget/train_widget.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainBloc, TrainState>(
      builder: (context, state) {
        if (state is TrainLoaded) {
          List<TrainModel> data = state.mydata;
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
                  color: Colors.deepOrange,
                  iconStyle: IconStyle(
                    iconData: Icons.school,
                    color: Colors.white,
                  ),
                ),
                beforeLineStyle: LineStyle(
                  color: Colors.deepOrange.shade300,
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: Colors.deepOrange.shade300,
                  thickness: 2,
                ),
                startChild:
                    isLeftAligned ? _buildTrainingCard(data[index]) : null,
                endChild:
                    !isLeftAligned ? _buildTrainingCard(data[index]) : null,
              );
            },
          );
        } else if (state is TrainLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildTrainingCard(TrainModel model) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
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
            const SizedBox(height: 6),
            Text(
              model.name,
              style: AppTextStyle.linkTextStyle(),
            ),
            const SizedBox(height: 6),
            Text(
              model.address,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
