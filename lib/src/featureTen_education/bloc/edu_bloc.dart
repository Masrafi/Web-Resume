
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/edu_repo.dart';
import 'edu_event.dart';
import 'edu_state.dart';

class EduBloc extends Bloc<EduEvent, EduState> {
  final EduRepo eduRepo;
  EduBloc({required this.eduRepo}) : super(InitialState()) {
    on<EduGetData>((event, emit) async {
    emit(EduLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await eduRepo.get();
    emit(EduLoaded(data));
    }
    catch (e){
    emit(EduError(e.toString()));
    }});
    
  }
}