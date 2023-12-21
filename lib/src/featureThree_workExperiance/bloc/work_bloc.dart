
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/work_repo.dart';
import 'work_event.dart';
import 'work_state.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  final WorkRepo workRepo;
  WorkBloc({required this.workRepo}) : super(InitialState()) {
    on<GetDataWork>((event, emit) async {
    emit(WorkLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await workRepo.get();
    emit(WorkLoaded(data));
    }
    catch (e){
    emit(WorkError(e.toString()));
    }});
    
  }
}