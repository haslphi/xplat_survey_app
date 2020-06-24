import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:xplatsurveydemo/model/survey.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/service/persistence.dart';

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
    List<Survey> surveyList = surveyListJson.map((surveyJson) => Survey.fromJson(surveyJson)).toList();

    //load and add local survey data
    //Persistence.loadFile('assets/data.json').then((body) => (jsonDecode(body) as List).map((json) => Survey.fromJson(json)).forEach((survey) {surveyList.add(survey);}));
    String fileBody = await Persistence.loadFile('assets/localSurveys.json').timeout(Duration(seconds: 5));
    (jsonDecode(fileBody) as List).map((json) => Survey.fromJson(json)).forEach((survey) {survey.isLocal = true; surveyList.add(survey);});

    return surveyList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load surveys');
  }
}

Future<SurveyDetail> fetchSurveyDetail(Survey survey) async {
  final baseUrl = SurveyApiConstants.baseUrl;
  if (!survey.isLocal) {
    final response = await http.get('$baseUrl/${survey.id}').timeout(SurveyApiConstants.timeoutDuration);
    
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var surveyJson = jsonDecode(response.body);
      SurveyDetail survey = SurveyDetail.fromJson(surveyJson);
      return survey;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load survey');
    }
  } else {
    String fileBody = await Persistence.loadFile('assets/localSurveyDetails.json').timeout(Duration(seconds: 5));
    SurveyDetail sd = (jsonDecode(fileBody) as List).map((json) => SurveyDetail.fromJson(json)).firstWhere((sd) => sd.id == survey.id);
    sd.isLocal = true;
    return sd;
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