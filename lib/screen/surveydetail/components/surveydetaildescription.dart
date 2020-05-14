import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';

class SurveyDetailDescription extends StatelessWidget {
  SurveyDetailDescription({@required this.surveyDetail, this.backgroundColor = Colors.white});

  final SurveyDetail surveyDetail;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 3,
                color: backgroundColor,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Theme.of(context).textTheme.title.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0),),
                        Text(
                          surveyDetail.description,
//                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam volu',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 16.0),),
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              children: <TextSpan> [
                                TextSpan(text: 'This survey includes '),
                                TextSpan(text: '${surveyDetail.questions.length} questions', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ' and takes approximately '),
                                TextSpan(text: '${(surveyDetail.questions.length*1.2).ceil()} minutes', style: TextStyle(fontWeight: FontWeight.bold)),
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
