import 'package:equatable/equatable.dart';

abstract class CertEvent extends Equatable {
@override
List<Object> get props => [];
}

class CertGetData extends CertEvent{
CertGetData();
}