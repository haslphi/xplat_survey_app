import 'package:enum_to_string/enum_to_string.dart';
import 'package:xplatsurveydemo/model/questiontype.dart';

class Question {
  final int nr;
  final QuestionType type;
  final String questionText;
  final String answers;

  Question({this.nr, this.type, this.questionText, this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        nr: json['nr'],
        type: EnumToString.fromString(QuestionType.values, json['type']),
        questionText: json['question'],
        answers: json['answers'].toString()
    );
  }
}
