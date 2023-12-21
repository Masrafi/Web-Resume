import 'package:equatable/equatable.dart';

abstract class EduEvent extends Equatable {
@override
List<Object> get props => [];
}

class EduGetData extends EduEvent{
EduGetData();
}