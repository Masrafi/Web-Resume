import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/work_model.dart';

abstract class WorkState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends WorkState{}
class WorkError extends WorkState {
final String error;
WorkError(this.error);
@override
List<Object?> get props => [error];
}

class WorkLoading extends WorkState {
@override
List<Object?> get props => [];
}
class WorkLoaded extends WorkState{
List<WorkModel> mydata;
WorkLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
