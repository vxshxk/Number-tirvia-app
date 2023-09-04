import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Failure extends Equatable{
  Failure([List properties = const <dynamic>[]]) : super(properties);
}

class ServerFailure extends Failure{}
class CacheFailure extends Failure{}
