import 'package:flutter/cupertino.dart';

@immutable
abstract class CountState {}

class CountInitialState extends CountState {}

class CountLoadingState extends CountState {}

class CountLoadedState extends CountState {}
