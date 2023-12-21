import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/edu_model.dart';

abstract class EduState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends EduState{}
class EduError extends EduState {
final String error;
EduError(this.error);
@override
List<Object?> get props => [error];
}

class EduLoading extends EduState {
@override
List<Object?> get props => [];
}
class EduLoaded extends EduState{
List<EduModel> mydata;
EduLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
