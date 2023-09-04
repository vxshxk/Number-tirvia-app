import 'package:dartz/dartz.dart';
import 'package:number_trivia_app/core/errors/failure.dart';
import 'package:number_trivia_app/features/domain/repositories/number_trivia_repo.dart';
import 'package:number_trivia_app/core/usecases/usecase.dart';

import '../entities/number_trivia.dart';


class GetRandomNumberTrivia implements Usecase<NumberTrivia, NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async{
    return await repository.getRandomNumberTrivia();
  }
}