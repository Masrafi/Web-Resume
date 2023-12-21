
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/workEx_repo.dart';
import 'workEx_event.dart';
import 'workEx_state.dart';

class WorkExBloc extends Bloc<WorkExEvent, WorkExState> {
  final WorkExRepo workExRepo;
  WorkExBloc({required this.workExRepo}) : super(InitialState()) {
    on<WorkExGetData>((event, emit) async {
    emit(WorkExLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await workExRepo.get();
    emit(WorkExLoaded(data));
    }
    catch (e){
    emit(WorkExError(e.toString()));
    }});
    
  }
}