import 'package:equatable/equatable.dart';

abstract class TrainEvent extends Equatable {
@override
List<Object> get props => [];
}

class TrainGetData extends TrainEvent{
TrainGetData();
}