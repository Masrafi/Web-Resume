import 'package:equatable/equatable.dart';

abstract class FluEvent extends Equatable {
@override
List<Object> get props => [];
}

class FluGetData extends FluEvent{
FluGetData();
}