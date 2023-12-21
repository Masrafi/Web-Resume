import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';

import '../model/language_model.dart';

abstract class LanguageState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends LanguageState{}
class LanguageError extends LanguageState {
final String error;
LanguageError(this.error);
@override
List<Object?> get props => [error];
}

class LanguageLoading extends LanguageState {
@override
List<Object?> get props => [];
}
class LanguageLoaded extends LanguageState{
List<LanguageModel> mydata;
LanguageLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
