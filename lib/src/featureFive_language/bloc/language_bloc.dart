
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/language_repo.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepo languageRepo;
  LanguageBloc({required this.languageRepo}) : super(InitialState()) {
    on<LanguageGetData>((event, emit) async {
    emit(LanguageLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await languageRepo.get();
    emit(LanguageLoaded(data));
    }
    catch (e){
    emit(LanguageError(e.toString()));
    }});
    
  }
}