import 'package:equatable/equatable.dart';
import 'package:resume/src/feature0ne_introduction/model/intro_model.dart';
import 'package:resume/src/featureTherteen_certification/model/cer_model.dart';

abstract class CertState extends Equatable {
@override
List<Object?> get props => [];
}
class InitialState extends CertState{}
class CerError extends CertState {
final String error;
CerError(this.error);
@override
List<Object?> get props => [error];
}

class CerLoading extends CertState {
@override
List<Object?> get props => [];
}
class CerLoaded extends CertState{
List<CertModel> mydata;
CerLoaded(this.mydata);
@override
List<Object?> get props =>[mydata];
}
