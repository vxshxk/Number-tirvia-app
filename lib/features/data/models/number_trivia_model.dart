import 'package:number_trivia_app/features/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia{
  NumberTriviaModel({
    required String trivia,
    required int number
}) : super(
      trivia: trivia,
      number: number
  );

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json){
    return NumberTriviaModel(
        trivia: json['text'],
        number: (json['number'] as num).toInt()
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'text' : trivia,
      'number' : number
    };
  }
}