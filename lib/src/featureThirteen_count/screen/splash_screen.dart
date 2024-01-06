import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/utils/app_text_style.dart';

import '../bloc/count_bloc.dart';
import '../bloc/count_event.dart';
import '../bloc/count_state.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CountBloc>(context).add(SetCount());
    return Scaffold(
      body: BlocConsumer<CountBloc, CountState>(
        listener: (context, state) {
          if (state is CountLoadedState) {
            Navigator.pushReplacementNamed(context, "/home");
          }
        },
        builder: (context, state) {
          if (state is CountLoadingState) {
            return  Center(child: Text("Resume of Masrafi Anam", style: AppTextStyle.splashStyle(),));
          }
          return Container();
        },
      ),
    );
  }
}
