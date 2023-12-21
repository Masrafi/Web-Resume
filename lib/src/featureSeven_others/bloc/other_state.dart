import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/other_model.dart';

abstract class OtherState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends OtherState{}
class OtherError extends OtherState {
final String error;
OtherError(this.error);
@override
List<Object?> get props => [error];
}

class OtherLoading extends OtherState {
@override
List<Object?> get props => [];
}
class OtherLoaded extends OtherState{
List<OtherModel> mydata;
OtherLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
