import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'src/feature_splashScreen/bloc/splash_bloc.dart';
import 'src/feature_splashScreen/screen/splash_screen.dart';
import 'utils/route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
     // await Firebase.initializeApp(options: const FirebaseOptions(
     //        apiKey: 'AIzaSyAKbmHiyCh-PtZJejJCqspAIJhjgE1-j54',
     //        appId: '1:703989381905:web:57670f6b6bdfcc30076ab0',
     //        messagingSenderId: '703989381905',
     //        projectId: '1:703989381905:web:57670f6b6bdfcc30076ab0',
     //      ));
  }else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      home: BlocProvider(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          ),
    );
  }
}
