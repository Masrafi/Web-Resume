
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/cer_repo.dart';
import 'cer_event.dart';
import 'cer_state.dart';

class CerBloc extends Bloc<CerEvent, CerState> {
  final CerRepo cerRepo;
  CerBloc({required this.cerRepo}) : super(InitialState()) {
    on<CerGetData>((event, emit) async {
    emit(CerLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await cerRepo.get();
    emit(CerLoaded(data));
    }
    catch (e){
    emit(CerError(e.toString()));
    }});
    
  }
}