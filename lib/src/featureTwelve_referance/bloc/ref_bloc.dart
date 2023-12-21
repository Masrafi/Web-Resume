
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ref_repo.dart';
import 'ref_event.dart';
import 'ref_state.dart';

class RefBloc extends Bloc<RefEvent, RefState> {
  final RefRepo rafRepo;
  RefBloc({required this.rafRepo}) : super(InitialState()) {
    on<RefGetData>((event, emit) async {
    emit(RefLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await rafRepo.get();
    emit(RefLoaded(data));
    }
    catch (e){
    emit(RefError(e.toString()));
    }});
    
  }
}