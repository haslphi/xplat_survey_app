import 'dart:convert';

import 'package:xplatsurveydemo/model/question.dart';

class SurveyDetail {
  final int id;
  final String title;
  final String description;
  final List<Question> questions;
  bool isLocal = false; /// used to mark this survey as retrieved from asset storage

  SurveyDetail({this.id, this.title, this.description, this.questions,});

  factory SurveyDetail.fromJson(Map<String, dynamic> json) {
    return SurveyDetail(
      id: json['id'],
      title: json['title'],
      description: json['desc'],
      questions: (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'title': title,
        'desc': description,
        'questions': questions.map((q) => q.toJson()).toList()
      };

  @override
  String toString() {
    return '{ id: $id, title: $title, description: $description, isLocal: $isLocal }';
  }

  static clone(SurveyDetail surveyDetail) {
    SurveyDetail clone = SurveyDetail.fromJson(jsonDecode(jsonEncode(surveyDetail)));
    clone.isLocal = surveyDetail.isLocal;
    return clone;
  }
}