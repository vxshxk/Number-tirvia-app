import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class NumberTrivia extends Equatable{
  String? trivia;
  int? number;

  NumberTrivia({
    @required this.trivia,
    @required this.number,
}): super([trivia, number]);
}