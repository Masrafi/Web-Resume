
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/per_repo.dart';
import 'per_event.dart';
import 'per_state.dart';

class PerBloc extends Bloc<PerEvent, PerState> {
  final PerRepo perRepo;
  PerBloc({required this.perRepo}) : super(InitialState()) {
    on<PerGetData>((event, emit) async {
    emit(PerLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await perRepo.get();
    emit(PerLoaded(data));
    }
    catch (e){
    emit(PerError(e.toString()));
    }});
    
  }
}