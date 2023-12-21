import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/cer_model.dart';

abstract class CerState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends CerState{}
class CerError extends CerState {
final String error;
CerError(this.error);
@override
List<Object?> get props => [error];
}

class CerLoading extends CerState {
@override
List<Object?> get props => [];
}
class CerLoaded extends CerState{
List<CerModel> mydata;
CerLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
