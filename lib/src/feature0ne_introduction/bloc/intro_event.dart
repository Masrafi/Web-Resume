import 'package:equatable/equatable.dart';

abstract class IntroEvent extends Equatable {
@override
List<Object> get props => [];
}

class GetData extends IntroEvent{
GetData();
}