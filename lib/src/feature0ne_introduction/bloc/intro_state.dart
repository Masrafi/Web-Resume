import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

abstract class IntroState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends IntroState{}
class IntroError extends IntroState {
final String error;
IntroError(this.error);
@override
List<Object?> get props => [error];
}

class IntroLoading extends IntroState {
@override
List<Object?> get props => [];
}
class IntroLoaded extends IntroState{
List<IntroModel> mydata;
IntroLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
