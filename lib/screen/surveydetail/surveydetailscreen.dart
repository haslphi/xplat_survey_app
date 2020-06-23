import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/model/surveyPaused.dart';
import 'package:xplatsurveydemo/restClient/surveyRestClient.dart';
import 'package:xplatsurveydemo/screen/surveydetail/components/surveydetaildescription.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/components/surveyoverviewicon.dart';
import 'package:xplatsurveydemo/service/const.dart' as Const;
import 'package:xplatsurveydemo/service/navigation.dart' as Nav;
import 'package:xplatsurveydemo/service/persistence.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar =
    const SnackBar(content: Text('This is a list of all available surveys'));

/// This is the stateful widget that the main application instantiates.
class SurveyDetailScreen extends StatefulWidget {
  SurveyDetailScreen({Key key, this.surveyId, this.surveyTitle, this.backgroundColor = Colors.blue})
      : super(key: key);

  final int surveyId;
  final String surveyTitle;
  final Color backgroundColor;

  @override
  _SurveyDetailScreenState createState() => _SurveyDetailScreenState();
}

class _SurveyDetailScreenState extends State<SurveyDetailScreen> {
  Future<SurveyDetail> futureSurvey;
  SurveyDetail surveyDetail;
  SurveyPaused surveyPaused;

  @override
  void initState() {
    super.initState();
    futureSurvey = fetchSurveyById(widget.surveyId);
    surveyPaused = surveyPaused ?? Persistence.getSurveyPaused(widget.surveyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            SurveyOverviewIcon(id: widget.surveyId, size: SurveyOverviewIconSize.SMALL, backgroundColor: widget.backgroundColor,),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0),),
            Expanded(
                flex: 1,
                child: Text(
                  widget.surveyTitle,
                  softWrap: false,
                  overflow: TextOverflow.fade,)
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
                  child: FutureBuilder(
                    future: futureSurvey,
                    builder: (context, surveySnap) {
                      if (surveySnap.hasData) {
                        surveyDetail = surveySnap.data;
                        Persistence.addSurveySeen(surveyDetail.id);
                        return SurveyDetailDescription(surveyDetail: surveyDetail, backgroundColor: widget.backgroundColor,);
                      } else if (surveySnap.hasError) {
                        return Text("${surveySnap.error}");
                      }
                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  )
              ),
          Expanded(
            child: Align(
              // aligns row with buttons to bottom of expanded widget
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    OutlineButton(
                      // transform form to json string and backwards to make a 'clone'
                      onPressed: surveyPaused != null ? () => Nav.startSurvey(context, SurveyPaused.fromJson(jsonDecode(jsonEncode(surveyPaused))).surveyDetail, pageIndex: surveyPaused.pausedAtPageIndex.toInt()) : null,
                      textColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text('Resume'),
                    ),
                    SizedBox(width: 16,),
                    FloatingActionButton.extended(
                      icon: Icon(Icons.play_arrow),
                      label: Text('Start'),
                      backgroundColor: widget.backgroundColor,
                      onPressed: () => Nav.startSurvey(context, SurveyDetail.fromJson(jsonDecode(jsonEncode(surveyDetail))), pageIndex: 0),
                      heroTag: Const.detailsStartSurveyIconTag,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
