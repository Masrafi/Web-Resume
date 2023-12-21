import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/ref_model.dart';

abstract class RefState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends RefState{}
class RefError extends RefState {
final String error;
RefError(this.error);
@override
List<Object?> get props => [error];
}

class RefLoading extends RefState {
@override
List<Object?> get props => [];
}
class RefLoaded extends RefState{
List<RefModel> mydata;
RefLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
