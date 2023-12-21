
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/src/feature0ne_introduction/repo/intro_repo.dart';
import 'package:resume/src/featureTherteen_certification/bloc/cer_event.dart';
import 'package:resume/src/featureTherteen_certification/bloc/cer_state.dart';
import 'package:resume/src/featureTherteen_certification/repo/cer_repo.dart';

class CertBloc extends Bloc<CertEvent, CertState> {
  final CertRepo certRepo;
  CertBloc({required this.certRepo}) : super(InitialState()) {
    on<CertGetData>((event, emit) async {
    emit(CerLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
    final data = await certRepo.get();
    emit(CerLoaded(data));
    }
    catch (e){
    emit(CerError(e.toString()));
    }});
    
  }
}