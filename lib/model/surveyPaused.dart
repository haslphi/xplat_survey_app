import 'dart:convert';

import 'package:xplatsurveydemo/model/surveyDetails.dart';

const String _pageIndex = 'pausedAtPageIndex';
const String _surveyDetail = 'surveyDetail';
const String _isLocal = 'isLocal';

class SurveyPaused {
  final double pausedAtPageIndex;
  final SurveyDetail surveyDetail;
  bool isLocal;

  SurveyPaused({this.surveyDetail, this.pausedAtPageIndex, this.isLocal});

  static _surveyDetailFromJson(Map<String, dynamic> json) {
    SurveyDetail surveyDetail = SurveyDetail.fromJson(json);
    surveyDetail.isLocal = true;
    return surveyDetail;
  }

  factory SurveyPaused.fromJson(Map<String, dynamic> json) {
    return SurveyPaused(
      pausedAtPageIndex: json[_pageIndex],
      surveyDetail: _surveyDetailFromJson(json[_surveyDetail]),//SurveyDetail.fromJson(json[_surveyDetail]),
      isLocal: json[_isLocal],
    );
  }

  Map<String, dynamic> toJson() => {
    _pageIndex: pausedAtPageIndex,
    _surveyDetail: surveyDetail.toJson(),
    _isLocal: true,
  };

  static clone(SurveyPaused surveyPaused) {
    SurveyPaused clone = SurveyPaused.fromJson(jsonDecode(jsonEncode(surveyPaused)));
    clone.surveyDetail.isLocal = surveyPaused.surveyDetail.isLocal;
    return clone;
  }
}