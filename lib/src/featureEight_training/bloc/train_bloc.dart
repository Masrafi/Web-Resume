
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/train_repo.dart';
import 'train_event.dart';
import 'train_state.dart';

class TrainBloc extends Bloc<TrainEvent, TrainState> {
  final TrainRepo trainRepo;
  TrainBloc({required this.trainRepo}) : super(InitialState()) {
    on<TrainGetData>((event, emit) async {
    emit(TrainLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await trainRepo.get();
    emit(TrainLoaded(data));
    }
    catch (e){
    emit(TrainError(e.toString()));
    }});
    
  }
}