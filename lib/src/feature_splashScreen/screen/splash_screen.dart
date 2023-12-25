import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/utils/app_text_style.dart';

import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(SetSplash());
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
            Navigator.pushReplacementNamed(context, "/home");
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
