import 'package:equatable/equatable.dart';

abstract class WorkEvent extends Equatable {
@override
List<Object> get props => [];
}

class GetDataWork extends WorkEvent{
GetDataWork();
}