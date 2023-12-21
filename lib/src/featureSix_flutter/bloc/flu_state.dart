import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';
import 'package:resume/src/featureSix_flutter/model/flu_model.dart';

abstract class FluState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends FluState{}
class FluError extends FluState {
final String error;
FluError(this.error);
@override
List<Object?> get props => [error];
}

class FluLoading extends FluState {
@override
List<Object?> get props => [];
}
class FluLoaded extends FluState{
List<FluModel> mydata;
FluLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
