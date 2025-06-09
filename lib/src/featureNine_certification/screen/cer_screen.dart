import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../utils/app_text_style.dart';
import '../bloc/cer_bloc.dart';
import '../bloc/cer_state.dart';
import '../model/cer_model.dart';

class CerScreen extends StatelessWidget {
  const CerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CerBloc, CerState>(
      builder: (context, state) {
        if (state is CerLoaded) {
          List<CerModel> data = state.mydata;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
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
                  width: 24,
                  color: Colors.teal,
                  iconStyle: IconStyle(
                    iconData: Icons.verified,
                    color: Colors.white,
                  ),
                ),
                beforeLineStyle: LineStyle(
                  color: Colors.teal.shade300,
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: Colors.teal.shade300,
                  thickness: 2,
                ),
                startChild: isLeftAligned
                    ? _buildCertificationCard(data[index], index)
                    : null,
                endChild: !isLeftAligned
                    ? _buildCertificationCard(data[index], index)
                    : null,
              );
            },
          );
        } else if (state is CerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildCertificationCard(CerModel model, int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Shadow color
            blurRadius: 10, // Softness of the shadow
            offset: Offset(0, 4), // Position of the shadow (X, Y)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 4.0,
            children: [
              Text(
                '${index + 1}. ',
                style: AppTextStyle.introTextStyle(),
              ),
              Text(
                model.title,
                style: AppTextStyle.introTextStyle(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '    ${model.discribtion}',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
