import 'package:number_trivia_app/features/domain/entities/number_trivia.dart';
import 'package:number_trivia_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}