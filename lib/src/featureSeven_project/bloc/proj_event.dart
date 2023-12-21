import 'package:equatable/equatable.dart';

abstract class ProjEvent extends Equatable {
@override
List<Object> get props => [];
}

class ProjGetData extends ProjEvent{
ProjGetData();
}