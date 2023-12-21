
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/other_repo.dart';
import 'other_event.dart';
import 'other_state.dart';

class OtherBloc extends Bloc<OtherEvent, OtherState> {
  final OtherRepo otherRepo;
  OtherBloc({required this.otherRepo}) : super(InitialState()) {
    on<OtherGetData>((event, emit) async {
    emit(OtherLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await otherRepo.get();
    emit(OtherLoaded(data));
    }
    catch (e){
    emit(OtherError(e.toString()));
    }});
    
  }
}