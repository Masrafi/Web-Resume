import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/train_model.dart';

abstract class TrainState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends TrainState{}
class TrainError extends TrainState {
final String error;
TrainError(this.error);
@override
List<Object?> get props => [error];
}

class TrainLoading extends TrainState {
@override
List<Object?> get props => [];
}
class TrainLoaded extends TrainState{
List<TrainModel> mydata;
TrainLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
