import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/featureThirteen_count/bloc/count_bloc.dart';
import 'package:resume/src/home/home.dart';
import 'package:resume/utils/app_text_style.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../show.dart';
import '../../featureThirteen_count/bloc/count_event.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(SetSplash());
    BlocProvider.of<CountBloc>(context).add(SetCount());
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
            Navigator.pushReplacementNamed(context, "/home");
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowCaseWidget(
            //   builder: Builder(
            //     builder: (_) => MailPage(),
            //   ),
            // )));  
          }
        },
        builder: (context, state) {
          if (state is SplashLoadingState) {
            return  Center(child: Text("Resume of Masrafi Anam", style: AppTextStyle.splashStyle(),));
          }
          return Container();
        },
      ),
    );
  }
}
