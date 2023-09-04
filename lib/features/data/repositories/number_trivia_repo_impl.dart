import 'package:dartz/dartz.dart';
import 'package:number_trivia_app/core/errors/exceptions.dart';
import 'package:number_trivia_app/core/errors/failure.dart';
import 'package:number_trivia_app/core/network/network_info.dart';
import 'package:number_trivia_app/features/data/datasourcces/number_trivia_local_data_source.dart';
import 'package:number_trivia_app/features/data/datasourcces/number_trivia_remote_data_source.dart';
import 'package:number_trivia_app/features/data/models/number_trivia_model.dart';
import 'package:number_trivia_app/features/domain/entities/number_trivia.dart';
import 'package:number_trivia_app/features/domain/repositories/number_trivia_repo.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  NetworkInfo networkinfo;
  NumberTriviaLocalDataSource? localdatasource;
  NumberTriviaRemoteDataSource? remotedatasource;

  NumberTriviaRepositoryImpl({
    required this.networkinfo,
    required this.localdatasource,
    required this.remotedatasource,
  });


  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    return await _getTrivia((){
      return remotedatasource!.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia((){
      return remotedatasource!.getRandomNumberTrivia();
    });
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      Future<NumberTrivia> _select()
  ) async {
    if (await networkinfo.isConnected) {
      try {
        final remoteTrivia = await _select();
        localdatasource?.cacheNumberTrivia(remoteTrivia as NumberTriviaModel);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localdatasource?.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}