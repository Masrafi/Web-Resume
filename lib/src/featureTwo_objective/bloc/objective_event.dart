import 'package:equatable/equatable.dart';

abstract class ObjectiveEvent extends Equatable {
@override
List<Object> get props => [];
}

class GetDataObj extends ObjectiveEvent{
GetDataObj();
}