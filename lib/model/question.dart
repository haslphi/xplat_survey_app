import 'package:enum_to_string/enum_to_string.dart';
import 'package:xplatsurveydemo/model/answer.dart';
import 'package:xplatsurveydemo/model/questiontype.dart';

class Question {
  final int id;
  final QuestionType type;
  final String questionText;
  final List<Answer> answers;
  final String sAnswers;

  Question({this.id, this.type, this.questionText, this.answers, this.sAnswers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      type: EnumToString.fromString(QuestionType.values, json['type']),
      questionText: json['question'],
      answers: (json['answers'] as List).map((a) => Answer.fromJson(a)).toList(),
    );
  }

  @override
  String toString() {
    return '{ id: $id, answers: ${answers.toString()}, type: $type, questionText: $questionText }';
  }
}
