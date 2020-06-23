import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xplatsurveydemo/model/surveyPaused.dart';
import 'package:xplatsurveydemo/service/const.dart' as Const;

class Persistence {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static getString(String key, [String defValue]) {
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }

  static List<String> getStringList(String key) {
    return _prefsInstance.getStringList(key) ?? List<String>();
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    var prefs = await _instance;
    return prefs?.setStringList(key, value) ?? Future.value(false);
  }

  static Future<bool> addSurveySeen(int surveyId) {
    List<String> surveysSeen = getStringList(Const.SURVEYS_SEEN) ?? List<String>();
    if(surveysSeen.contains(surveyId.toString())) {
      return Future.value(true);
    }
    surveysSeen.add(surveyId.toString());
    return setStringList(Const.SURVEYS_SEEN, surveysSeen);
  }

  static Future<bool> addSurveyPaused(SurveyPaused surveyPaused) {
    return setString('${Const.SURVEY_PAUSED}${surveyPaused.surveyDetail.id.toString()}', jsonEncode(surveyPaused));
  }

  static getSurveyPaused(int surveyId) {
    String surveyPausedString = getString('${Const.SURVEY_PAUSED}${surveyId.toString()}');
//    String surveyPausedString = loadFile('assets/data.json', context).then((value) => null);
     SurveyPaused surveyPaused;
     if(surveyPausedString.isNotEmpty) {
       Map<String, dynamic> surveyPausedJSON = jsonDecode(surveyPausedString);
       surveyPaused = SurveyPaused.fromJson(surveyPausedJSON);
     }
     return surveyPaused;
  }

  static Future<bool> clear() async {
    var prefs = await _instance;
    return prefs?.clear() ?? Future.value(false);
  }

  Future<String> loadFile(String fileName, BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString(fileName);
  }
}