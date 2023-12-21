import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/per_model.dart';

abstract class PerState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends PerState{}
class PerError extends PerState {
final String error;
PerError(this.error);
@override
List<Object?> get props => [error];
}

class PerLoading extends PerState {
@override
List<Object?> get props => [];
}
class PerLoaded extends PerState{
List<PerModel> mydata;
PerLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
