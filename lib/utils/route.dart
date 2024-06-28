import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/feature0ne_introduction/bloc/intro_bloc.dart';
import 'package:resume/src/feature0ne_introduction/repo/intro_repo.dart';
import 'package:resume/src/featureEight_training/bloc/train_bloc.dart';
import 'package:resume/src/featureEight_training/repo/train_repo.dart';
import 'package:resume/src/featureElaven_personalDetails/bloc/per_bloc.dart';
import 'package:resume/src/featureElaven_personalDetails/repo/per_repo.dart';
import 'package:resume/src/featureFive_language/bloc/language_bloc.dart';
import 'package:resume/src/featureFive_language/repo/language_repo.dart';
import 'package:resume/src/featureNine_certification/bloc/cer_bloc.dart';
import 'package:resume/src/featureNine_certification/repo/cer_repo.dart';
import 'package:resume/src/featureSeven_project/bloc/proj_bloc.dart';
import 'package:resume/src/featureSeven_project/repo/proj_repo.dart';
import 'package:resume/src/featureSix_flutter/bloc/flu_bloc.dart';
import 'package:resume/src/featureSix_flutter/repo/flu_repo.dart';
import 'package:resume/src/featureTen_education/bloc/edu_bloc.dart';
import 'package:resume/src/featureTen_education/repo/edu_repo.dart';
import 'package:resume/src/featureThree_workExperiance/bloc/work_bloc.dart';
import 'package:resume/src/featureThree_workExperiance/repo/work_repo.dart';
import 'package:resume/src/featureTwelve_referance/bloc/ref_bloc.dart';
import 'package:resume/src/featureTwelve_referance/repo/ref_repo.dart';
import 'package:resume/src/featureTwo_objective/bloc/objective_bloc.dart';

import '../src/featureFour_workExperiance/bloc/workEx_bloc.dart';
import '../src/featureFour_workExperiance/repo/workEx_repo.dart';
import '../src/featureTherteen_certification/bloc/cer_bloc.dart';
import '../src/featureTherteen_certification/repo/cer_repo.dart';
import '../src/featureTwo_objective/repo/objective_repo.dart';
import '../src/home/home.dart';


class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
                     providers: [
                       BlocProvider<IntroBloc>(
                         create: (context) => IntroBloc(introRepo: IntroRepo()),
                       ),
                       BlocProvider<ObjectiveBloc>(
                         create: (context) => ObjectiveBloc(objectiveRepo: ObjectiveRepo()),
                       ),
                       BlocProvider<WorkBloc>(
                          create: (context) => WorkBloc(workRepo: WorkRepo()),
                        ),
                        BlocProvider<WorkExBloc>(
                          create: (context) => WorkExBloc(workExRepo: WorkExRepo()),
                        ),
                        BlocProvider<LanguageBloc>(
                          create: (context) => LanguageBloc(languageRepo: LanguageRepo()),
                        ),
                        BlocProvider<FluBloc>(
                          create: (context) => FluBloc(fluRepo: FluRepo()),
                        ),
                        BlocProvider<ProjBloc>(
                          create: (context) => ProjBloc(projRepo: ProjRepo()),
                        ),
                        BlocProvider<TrainBloc>(
                          create: (context) => TrainBloc(trainRepo: TrainRepo()),
                        ),
                        BlocProvider<CerBloc>(
                          create: (context) => CerBloc(cerRepo: CerRepo()),
                        ),
                        BlocProvider<EduBloc>(
                          create: (context) => EduBloc(eduRepo: EduRepo()),
                        ),
                        BlocProvider<PerBloc>(
                          create: (context) => PerBloc(perRepo: PerRepo()),
                        ),
                        BlocProvider<RefBloc>(
                          create: (context) => RefBloc(rafRepo: RefRepo()),
                        ),
                        BlocProvider<CertBloc>(
                          create: (context) => CertBloc(certRepo: CertRepo()),
                        )
                     ],
                     child: const Home(),
                   ),
        );
      // case "/home":
      //   return MaterialPageRoute(
      //     builder: (context) => MultiRepositoryProvider(
      //       providers: [
      //         RepositoryProvider(
      //           create: (context) => RepositoryToday(),
      //         ),
      //         RepositoryProvider(
      //           create: (context) => RepositoryLive(),
      //         ),
      //         RepositoryProvider(
      //           create: (context) => RepositoryCorrigen(),
      //         ),
      //         RepositoryProvider(
      //           create: (context) => RepositoryPrivate(),
      //         ),
      //       ],
      //       child: const Home(),
      //     ),
      //   );
      // case "/todayDetails":
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => RepositoryTodayTenderDetails(),
      //       child: TodayTenderDetailsScreen(),
      //     ),
      //   );
      // case "/corrigenDetails":
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => RepositoryCorrigenTenderDetails(),
      //       child: CorrigenTenderDetailsScreen(),
      //     ),
      //   );
      // case "/privateDetails":
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => RepositoryPrivateTenderDetails(),
      //       child: PrivateTenderDetailsScreen(),
      //     ),
      //   );
      // case "/liveDetails":
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => RepositoryLiveTenderDetails(),
      //       child: LiveTenderDetailsScreen(),
      //     ),
      //   );
      // case "/savetendershow":
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => RepositorySaveTenderShow(),
      //       child: SaveTenderShowScreen(),
      //     ),
      //   );
      // case "/registration":
      //   return MaterialPageRoute(
      //     builder: (context) => Registration(),
      //   );
      // case "/categorygroup":
      //   Map<String, dynamic> arguments =
      //       settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => RepositoryCategoryGroup(),
      //       child: CategoryGroup(
      //         name: arguments["namer"],
      //         designation: arguments["degicnation"],
      //         organization: arguments["organization"],
      //         phoneNum: arguments["phoneNum"],
      //         emailFirst: arguments["emailFirst"],
      //         password: arguments["password"],
      //         group: arguments["group"],
      //       ),
      //     ),
      //   );
      // case "/relatedgroup":
      //   Map<String, dynamic> arguments =
      //       settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => RepositoryRelatedCategory(),
      //       child: ReletedCategory(
      //         tGHCode: arguments["tGHCode"],
      //         name: arguments["namer"],
      //         designation: arguments["degicnation"],
      //         organization: arguments["organization"],
      //         phoneNum: arguments["phoneNum"],
      //         emailFirst: arguments["emailFirst"],
      //         password: arguments["password"],
      //         group: arguments["group"],
      //       ),
      //     ),
      //   );
      //
      // case "/option":
      //   Map<String, dynamic> arguments =
      //       settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (context) => RepositoryProvider(
      //       create: (context) => RepositoryOption(),
      //       child: Option(
      //         tGHCode: arguments["tGHCode"],
      //         name: arguments["namer"],
      //         designation: arguments["degicnation"],
      //         organization: arguments["organization"],
      //         phoneNum: arguments["phoneNum"],
      //         emailFirst: arguments["emailFirst"],
      //         password: arguments["password"],
      //         group: arguments["group"],
      //       ),
      //     ),
      //   );
      default:
        return null;
    }
  }
}
