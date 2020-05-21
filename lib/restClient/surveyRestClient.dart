import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:xplatsurveydemo/model/survey.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';

class SurveyApiConstants {
  static const baseUrl = 'http://www.birnbaua.at/jku/questionnaires';
}

Future<List<Survey>> fetchSurveys() async {
  final response = await http.get(SurveyApiConstants.baseUrl);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var surveyListJson = jsonDecode(response.body) as List;
    List<Survey> survey = surveyListJson.map((surveyJson) => Survey.fromJson(surveyJson)).toList();
    return survey;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load surveys');
  }
}

Future<SurveyDetail> fetchSurveyById(int surveyId) async {
  final baseUrl = SurveyApiConstants.baseUrl;
  final response = await http.get('$baseUrl/$surveyId');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var surveyJson = jsonDecode(response.body);
    SurveyDetail survey = SurveyDetail.fromJson(surveyJson);
    return survey;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load surveys');
  }
}