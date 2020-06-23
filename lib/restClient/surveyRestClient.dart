import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:xplatsurveydemo/model/survey.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';

class SurveyApiConstants {
  static const baseUrl = 'http://www.birnbaua.at/jku/questionnaires';
  static const timeoutDuration = Duration(seconds: 5);
}

Future<List<Survey>> fetchSurveys() async {
  final response = await http.get(SurveyApiConstants.baseUrl).timeout(SurveyApiConstants.timeoutDuration);

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
  final response = await http.get('$baseUrl/$surveyId').timeout(SurveyApiConstants.timeoutDuration);

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

Future<bool> submitSurvey(SurveyDetail surveyDetail) async {
  final baseUrl = SurveyApiConstants.baseUrl;
  final response = await http.post(
    '$baseUrl/${surveyDetail.id}/answered/philipp',
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(surveyDetail)
  ).timeout(SurveyApiConstants.timeoutDuration);

  if (response.statusCode == 200) {
    // well done
    return true;
  } else {
    throw Exception('Failed to create survey answer.');
  }
}