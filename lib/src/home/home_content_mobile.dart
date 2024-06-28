import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_divider.dart';
import '../../utils/app_text_style.dart';
import '../feature0ne_introduction/bloc/intro_bloc.dart';
import '../feature0ne_introduction/bloc/intro_event.dart';
import '../feature0ne_introduction/screen/intro_screen.dart';
import '../featureEight_training/bloc/train_bloc.dart';
import '../featureEight_training/bloc/train_event.dart';
import '../featureEight_training/screen/train_screen.dart';
import '../featureElaven_personalDetails/bloc/per_bloc.dart';
import '../featureElaven_personalDetails/bloc/per_event.dart';
import '../featureElaven_personalDetails/screen/per_screen.dart';
import '../featureFive_language/bloc/language_bloc.dart';
import '../featureFive_language/bloc/language_event.dart';
import '../featureFour_workExperiance/bloc/workEx_bloc.dart';
import '../featureFour_workExperiance/bloc/workEx_event.dart';
import '../featureFour_workExperiance/screen/workEx_screen.dart';
import '../featureNine_certification/bloc/cer_bloc.dart';
import '../featureNine_certification/bloc/cer_event.dart';
import '../featureNine_certification/screen/cer_screen.dart';
import '../featureSeven_project/bloc/proj_bloc.dart';
import '../featureSeven_project/bloc/proj_event.dart';
import '../featureSeven_project/screen/proj_screen.dart';
import '../featureSix_flutter/bloc/flu_bloc.dart';
import '../featureSix_flutter/bloc/flu_event.dart';
import '../featureSix_flutter/screen/flu_screen.dart';
import '../featureTen_education/bloc/edu_bloc.dart';
import '../featureTen_education/bloc/edu_event.dart';
import '../featureTen_education/screen/edu_screen.dart';
import '../featureTherteen_certification/bloc/cer_bloc.dart';
import '../featureTherteen_certification/bloc/cer_event.dart';
import '../featureTherteen_certification/screen/cer_screen.dart';
import '../featureThree_workExperiance/bloc/work_bloc.dart';
import '../featureThree_workExperiance/bloc/work_event.dart';
import '../featureThree_workExperiance/screen/work_screen.dart';
import '../featureTwelve_referance/bloc/ref_bloc.dart';
import '../featureTwelve_referance/bloc/ref_event.dart';
import '../featureTwelve_referance/screen/ref_screen.dart';
import '../featureTwo_objective/bloc/objective_bloc.dart';
import '../featureTwo_objective/bloc/objective_event.dart';
import '../featureTwo_objective/screen/objective_screen.dart';

class HomeContentMobile extends StatefulWidget {
  const HomeContentMobile({super.key});

  @override
  State<HomeContentMobile> createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile> {
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
    return Scaffold(
                                   body: Center(
                                     child: SingleChildScrollView(
                                       child: Padding(
                                         padding:  EdgeInsets.only(top: 20.0, bottom: 20, left: 20, right: 20),
                                         child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         //padding: const EdgeInsets.all(20.0),
                                         //shrinkWrap: true,
                                         children:  [
                                           IntroScreen(),
                                           SizedBox(height: 30,),
                                           Text('INTRODUCTION AND OBJECTIVE', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           ObjectiveScreen(),
                                           SizedBox(height: 30,),
                                           Text('WORK EXPERIENCE', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           WorkScreen(),
                                           SizedBox(height: 30,),
                                           Text('APP IN GOOGLE PLAY & APP STORE', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           WorkExScreen(),
                                           SizedBox(height: 30,),
                                           Text('TECHNICAL SKILLS', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                          SizedBox(height: 30,),
                                          FluScreen(),
                                           //OtherScreen(),
                                           SizedBox(height: 30,),
                                           Text('PROJECTS', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           ProjScreen(),
                                           SizedBox(height: 30,),
                                           Text('PARTICIPATION IN TRAINING', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           TrainScreen(),
                                           SizedBox(height: 30,),
                                           Text('ORGANISATIONAL CERTIFICATE', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           CerScreen(),
                                           SizedBox(height: 30,),
                                           Text('EDUCATION QUALIFICATION', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           EduScreen(),
                                           SizedBox(height: 30,),
                                           Text('PERSONAL DETAILS', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           PerScreen(),
                                           SizedBox(height: 30,),
                                           
                                           Text('REFERENCE', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           RefScreen(),
                                           SizedBox(height: 30,),
                                           Text('CERTIFICATION', style: AppTextStyle.highlightsTextStyle(),),
                                           AppDivider(),
                                           SizedBox(height: 10,),
                                           CertScreen(),
                                           SizedBox(height: 30,),
                                           Text('Info: This portfolio made with Flutter, Dart and Firebase. I look forward to the opportunity to discuss my qualifications in more detail. Please feel free to contact me at [phone number] or [email address]. Thank you for reviewing my portfolio.')
                                         ],
                                         ),
                                       ),
                                     ),
                                   )
                                  // )
                                   ); 
  }
}
