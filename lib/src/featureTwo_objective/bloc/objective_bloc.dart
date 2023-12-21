
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/featureTwo_objective/bloc/objective_state.dart';
import '../repo/objective_repo.dart';
import 'objective_event.dart';


class ObjectiveBloc extends Bloc<ObjectiveEvent, ObjectiveState> {
  final ObjectiveRepo objectiveRepo;
  ObjectiveBloc({required this.objectiveRepo}) : super(InitialState()) {
    on<GetDataObj>((event, emit) async {
    emit(ObjectiveLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await objectiveRepo.get();
    emit(ObjectiveLoaded(data));
    }
    catch (e){
    emit(ObjectiveError(e.toString()));
    }});
    
  }
}