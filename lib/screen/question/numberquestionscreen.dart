import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/components/questionButtonBar.dart';

class NumberQuestion extends StatefulWidget {
  NumberQuestion({@required this.surveyDetail, @required this.index, @required this.controller, @required this.scaffoldKey});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _NumberQuestionState createState() => _NumberQuestionState();
}

class _NumberQuestionState extends State<NumberQuestion> {
  Question question;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    question = widget.surveyDetail.questions[widget.index];
    textController.text = question.answers[0].value;
    textController.addListener(_setInputToModel);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textController.dispose();
    super.dispose();
  }

  _setInputToModel() {
    question.answers[0].value = textController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          question.questionText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: textController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                labelText: 'Enter your number'
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            QuestionButtonBar(
              isFirst: 0 == widget.index,
              isLast: widget.surveyDetail.questions.length == widget.index+1,
              surveyDetail: widget.surveyDetail,
              pageController: widget.controller,
              scaffoldKey: widget.scaffoldKey,
            ),
          ],
        )
    );
  }
}
