
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/proj_repo.dart';
import 'proj_event.dart';
import 'proj_state.dart';

class ProjBloc extends Bloc<ProjEvent, ProjState> {
  final ProjRepo projRepo;
  ProjBloc({required this.projRepo}) : super(InitialState()) {
    on<ProjGetData>((event, emit) async {
    emit(ProjLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await projRepo.get();
    emit(ProjLoaded(data));
    }
    catch (e){
    emit(ProjError(e.toString()));
    }});
    
  }
}