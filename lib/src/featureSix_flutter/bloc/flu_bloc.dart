
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/flu_repo.dart';
import 'flu_event.dart';
import 'flu_state.dart';

class FluBloc extends Bloc<FluEvent, FluState> {
  final FluRepo fluRepo;
  FluBloc({required this.fluRepo}) : super(InitialState()) {
    on<FluGetData>((event, emit) async {
    emit(FluLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await fluRepo.get();
    emit(FluLoaded(data));
    }
    catch (e){
    emit(FluError(e.toString()));
    }});
    
  }
}