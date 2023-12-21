import 'package:equatable/equatable.dart';

abstract class OtherEvent extends Equatable {
@override
List<Object> get props => [];
}

class OtherGetData extends OtherEvent{
OtherGetData();
}