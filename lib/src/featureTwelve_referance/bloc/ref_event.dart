import 'package:equatable/equatable.dart';

abstract class RefEvent extends Equatable {
@override
List<Object> get props => [];
}

class RefGetData extends RefEvent{
RefGetData();
}