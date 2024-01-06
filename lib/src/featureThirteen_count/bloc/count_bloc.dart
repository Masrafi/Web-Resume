import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/count_repo.dart';
import 'count_event.dart';
import 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  final CountRepo countRepo;
  CountBloc({required this.countRepo}) : super(CountInitialState()) {
    on<SetCount>((event, emit) async {
      try {
          final data = await countRepo.countUser();
          final data2 = await countRepo.deviceInfo();
          }
          catch (e){
          print(e.toString());
          }
    });
  }
}
