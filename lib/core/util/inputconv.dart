import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

class InputConverter{
  Either<Failure, int> stringToUnsignedInteger(String str){
    try {
      final integer=int.parse(str);
      if(integer<0) {
        throw FormatException();
      }
      else {
        return Left(InvalidInputFailure());
      }
    } on FormatException {
      return Left(InvalidInputFailure());
    }
}
}

class InvalidInputFailure extends Failure {}