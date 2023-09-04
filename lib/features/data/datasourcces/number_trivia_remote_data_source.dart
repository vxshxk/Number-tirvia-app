import 'dart:convert';
import 'package:number_trivia_app/core/errors/exceptions.dart';
import '../models/number_trivia_model.dart';
import 'package:http/http.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource{
  final Client client;

  NumberTriviaRemoteDataSourceImpl({required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    Uri url = Uri.parse('http://numbersapi.com/$number');
    return await getTriviaFromUrl(url);
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async{
    Uri url = Uri.parse('http://numbersapi.com/random');
    return await getTriviaFromUrl(url);
  }

  Future<NumberTriviaModel> getTriviaFromUrl(Uri url) async{
    final response = await client.get(url,
      headers: {'Content-Type': 'application/json'},
    );
    if(response.statusCode == 200) {
      return NumberTriviaModel.fromJson(jsonDecode(response.body));
    } else throw ServerException();
  }
}