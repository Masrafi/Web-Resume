import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/workEx_model.dart';

abstract class WorkExState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends WorkExState{}
class WorkExError extends WorkExState {
final String error;
WorkExError(this.error);
@override
List<Object?> get props => [error];
}

class WorkExLoading extends WorkExState {
@override
List<Object?> get props => [];
}
class WorkExLoaded extends WorkExState{
List<WorkExModel> mydata;
WorkExLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
