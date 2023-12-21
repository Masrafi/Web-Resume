import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/feature0ne_introduction/bloc/intro_bloc.dart';
import 'package:resume/src/feature0ne_introduction/bloc/intro_state.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';
import 'package:resume/src/feature0ne_introduction/widget/url_lancer.dart';
import 'package:resume/widgets/app_text_style.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../widget/into_body_url.dart';
import 'image/database_manager.dart';
import '../widget/intro_body.dart';
import 'image/image_view.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
   
  
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<IntroBloc, IntroState> (
    builder: (context, state) {
      if(state is IntroLoaded) {
        List<IntroModel> data = state.mydata;
        return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:  data.length,
        itemBuilder: (_, index) {
          return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageView(),
            Text(data[index].name, style: AppTextStyle.highlightsTextStyle(),),
            IntroBody(head: 'Mobile',title: data[index].mobile,),
            IntroBodyUrl(head: 'Email',title: data[index].email,),
            IntroBodyUrl(head: 'Skype',title: data[index].skype,),
            IntroBodyUrl(head: 'LinkDin',title: data[index].linkedIn,),
            
          
          ],
          );
        },
        );
      } else if(state is IntroLoading) {
        return const Center(child: CircularProgressIndicator(),);
      } else {
        return Container();
      }
    },
    )
    ;
  }
}
