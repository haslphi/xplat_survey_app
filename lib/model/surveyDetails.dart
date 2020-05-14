import 'package:xplatsurveydemo/model/question.dart';

class SurveyDetail {
  final int id;
  final String title;
  final String description;
  final List<Question> questions;

  SurveyDetail({this.id, this.title, this.description, this.questions});

  factory SurveyDetail.fromJson(Map<String, dynamic> json) {
    return SurveyDetail(
      id: json['id'],
      title: json['title'],
      description: json['desc'],
      questions: (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
    );
  }

  @override
  String toString() {
    return '{ id: $id, title: $title, description: $description }';
  }

}