import 'package:enum_to_string/enum_to_string.dart';
import 'package:xplatsurveydemo/model/answer.dart';
import 'package:xplatsurveydemo/model/questiontype.dart';

class Question {
  final int id;
  final QuestionType type;
  final String questionText;
  final List<Answer> answers;

  Question({this.id, this.type, this.questionText, this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      type: EnumToString.fromString(QuestionType.values, json['type']),
      questionText: json['question'],
      answers: (json['answers'] as List).map((a) => Answer.fromJson(a)).toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'type': type.toString(),
        'question': questionText,
        'answers': answers.map((a) => a.toJson()).toList()
      };

  @override
  String toString() {
    return '{ id: $id, answers: ${answers.toString()}, type: $type, questionText: $questionText }';
  }
}
