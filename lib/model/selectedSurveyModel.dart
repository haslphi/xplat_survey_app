import 'package:flutter/foundation.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';

class SelectedSurveyModel with ChangeNotifier {
  /// The private survey field
  SurveyDetail _surveyDetail;

  SurveyDetail get surveyDetail => _surveyDetail;

  set surveyDetail(SurveyDetail newSurveyDetail) {
    _surveyDetail = newSurveyDetail;
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}