import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/proj_model.dart';

abstract class ProjState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends ProjState{}
class ProjError extends ProjState {
final String error;
ProjError(this.error);
@override
List<Object?> get props => [error];
}

class ProjLoading extends ProjState {
@override
List<Object?> get props => [];
}
class ProjLoaded extends ProjState{
List<ProjModel> mydata;
ProjLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
