
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/feature0ne_introduction/bloc/intro_event.dart';
import 'package:resume/src/feature0ne_introduction/bloc/intro_state.dart';
import 'package:resume/src/feature0ne_introduction/repo/intro_repo.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IntroRepo introRepo;
  IntroBloc({required this.introRepo}) : super(InitialState()) {
    on<GetData>((event, emit) async {
    emit(IntroLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await introRepo.get();
    emit(IntroLoaded(data));
    }
    catch (e){
    emit(IntroError(e.toString()));
    }});
    
  }
}