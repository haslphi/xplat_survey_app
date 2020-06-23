import 'package:xplatsurveydemo/model/surveyDetails.dart';

const String _pageIndex = 'pausedAtPageIndex';
const String _surveyDetail = 'surveyDetail';

class SurveyPaused {
  final double pausedAtPageIndex;
  final SurveyDetail surveyDetail;

  SurveyPaused({this.surveyDetail, this.pausedAtPageIndex});

  factory SurveyPaused.fromJson(Map<String, dynamic> json) {
    return SurveyPaused(
      pausedAtPageIndex: json[_pageIndex],
      surveyDetail: SurveyDetail.fromJson(json[_surveyDetail]),
    );
  }

  Map<String, dynamic> toJson() => {
    _pageIndex: pausedAtPageIndex,
    _surveyDetail: surveyDetail.toJson(),
  };
}