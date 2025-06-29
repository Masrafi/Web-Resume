import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../utils/app_text_style.dart';
import '../bloc/edu_bloc.dart';
import '../bloc/edu_state.dart';
import '../model/edu_model.dart';

class EduScreen extends StatelessWidget {
  const EduScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EduBloc, EduState>(
      builder: (context, state) {
        if (state is EduLoaded) {
          List<EduModel> data = state.mydata;
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
                  color: Colors.deepPurple,
                  iconStyle: IconStyle(
                    iconData: Icons.school,
                    color: Colors.white,
                  ),
                ),
                beforeLineStyle: LineStyle(
                  color: Colors.deepPurple.shade300,
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: Colors.deepPurple.shade300,
                  thickness: 2,
                ),
                startChild: isLeftAligned
                    ? _buildEducationCard(data[index], index)
                    : null,
                endChild: !isLeftAligned
                    ? _buildEducationCard(data[index], index)
                    : null,
              );
            },
          );
        } else if (state is EduLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}

Widget _buildEducationCard(EduModel model, int index) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 4),
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
              model.degree,
              style: AppTextStyle.introTextStyle(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('Group: ${model.group}'),
        Text('Institution: ${model.institution}'),
        Text('Grade: ${model.grade}'),
        Text('Year: ${model.year}'),
      ],
    ),
  );
}
