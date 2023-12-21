import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/objective_model.dart';

abstract class ObjectiveState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends ObjectiveState{}
class ObjectiveError extends ObjectiveState {
final String error;
ObjectiveError(this.error);
@override
List<Object?> get props => [error];
}

class ObjectiveLoading extends ObjectiveState {
@override
List<Object?> get props => [];
}
class ObjectiveLoaded extends ObjectiveState{
List<ObjectiveModel> mydata;
ObjectiveLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
