import 'package:equatable/equatable.dart';
import 'package:number_trivia_app/core/errors/failure.dart';
import 'package:number_trivia_app/core/usecases/usecase.dart';
import 'package:number_trivia_app/features/domain/entities/number_trivia.dart';
import 'package:number_trivia_app/features/domain/repositories/number_trivia_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:number_trivia_app/core/usecases/usecase.dart';

class GetConcreteNumberTrivia implements Usecase<NumberTrivia,Params>{
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);


  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number!);
  }
}

class Params extends Equatable{
  int? number;
  Params({ required this.number}) : super([number]);
}