import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/src/feature0ne_introduction/screen/intro_screen.dart';
import 'package:resume/src/featureEight_training/bloc/train_bloc.dart';
import 'package:resume/src/featureEight_training/bloc/train_event.dart';
import 'package:resume/src/featureEight_training/screen/train_screen.dart';
import 'package:resume/src/featureElaven_personalDetails/bloc/per_bloc.dart';
import 'package:resume/src/featureElaven_personalDetails/bloc/per_event.dart';
import 'package:resume/src/featureElaven_personalDetails/screen/per_screen.dart';
import 'package:resume/src/featureFive_language/bloc/language_bloc.dart';
import 'package:resume/src/featureFive_language/bloc/language_event.dart';
import 'package:resume/src/featureNine_certification/bloc/cer_bloc.dart';
import 'package:resume/src/featureNine_certification/bloc/cer_event.dart';
import 'package:resume/src/featureSeven_project/bloc/proj_bloc.dart';
import 'package:resume/src/featureSeven_project/bloc/proj_event.dart';
import 'package:resume/src/featureSeven_project/screen/proj_screen.dart';
import 'package:resume/src/featureSix_flutter/bloc/flu_bloc.dart';
import 'package:resume/src/featureSix_flutter/bloc/flu_event.dart';
import 'package:resume/src/featureSix_flutter/screen/flu_screen.dart';
import 'package:resume/src/featureTen_education/bloc/edu_bloc.dart';
import 'package:resume/src/featureTen_education/bloc/edu_event.dart';
import 'package:resume/src/featureTen_education/screen/edu_screen.dart';
import 'package:resume/src/featureTherteen_certification/screen/cer_screen.dart';
import 'package:resume/src/featureThree_workExperiance/bloc/work_bloc.dart';
import 'package:resume/src/featureThree_workExperiance/bloc/work_event.dart';
import 'package:resume/src/featureTwelve_referance/bloc/ref_bloc.dart';
import 'package:resume/src/featureTwelve_referance/bloc/ref_event.dart';
import 'package:resume/src/featureTwelve_referance/screen/ref_screen.dart';
import 'package:resume/src/featureTwo_objective/bloc/objective_bloc.dart';
import 'package:resume/src/featureTwo_objective/bloc/objective_event.dart';
import 'package:resume/src/home/home_content_desktop.dart';
import 'package:resume/src/home/home_content_mobile.dart';
import 'package:resume/src/home/home_content_tablet.dart';
import 'package:resume/utils/app_text_style.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../utils/app_divider.dart';
import '../../utils/colors.dart';
import '../feature0ne_introduction/bloc/intro_bloc.dart';
import '../feature0ne_introduction/bloc/intro_event.dart';
import '../feature0ne_introduction/repo/intro_repo.dart';
import '../featureFive_language/screen/language_screen.dart';
import '../featureFour_workExperiance/bloc/workEx_bloc.dart';
import '../featureFour_workExperiance/bloc/workEx_event.dart';
import '../featureFour_workExperiance/screen/workEx_screen.dart';
import '../featureNine_certification/screen/cer_screen.dart';
import '../featureTherteen_certification/bloc/cer_bloc.dart';
import '../featureTherteen_certification/bloc/cer_event.dart';
import '../featureThree_workExperiance/screen/work_screen.dart';
import '../featureTwo_objective/screen/objective_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      BlocProvider.of<IntroBloc>(context).add(GetData());
      BlocProvider.of<ObjectiveBloc>(context).add(GetDataObj());
      BlocProvider.of<WorkBloc>(context).add(GetDataWork());
      BlocProvider.of<WorkExBloc>(context).add(WorkExGetData());
      BlocProvider.of<LanguageBloc>(context).add(LanguageGetData());
      BlocProvider.of<FluBloc>(context).add(FluGetData());
      BlocProvider.of<ProjBloc>(context).add(ProjGetData());
      BlocProvider.of<TrainBloc>(context).add(TrainGetData());
      BlocProvider.of<CerBloc>(context).add(CerGetData());
      BlocProvider.of<EduBloc>(context).add(EduGetData());
      BlocProvider.of<PerBloc>(context).add(PerGetData());
      BlocProvider.of<RefBloc>(context).add(RefGetData());
      BlocProvider.of<CertBloc>(context).add(CertGetData());
    }
     
  @override
  Widget build(BuildContext context) {
   
      return ResponsiveBuilder(
                 builder: (context, sizingInformation) {
                   // Check the sizing information here and return your UI
                       if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
                         print('Desktop');
                       return ShowCaseWidget(
                        builder: Builder(
                          builder: (_) => HomeContentDesktop(),
                        ),
                      );
                     }
             
                     if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
                       return HomeContentTablet();
                     }
             
                     if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
                       return HomeContentMobile();
                     }
             
                     return Container(color:Colors.purple);
                   },
               );
      
      
      
   
    
    
  }
}
