import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/restClient/surveyRestClient.dart';
import 'package:xplatsurveydemo/screen/question/components/nextButton.dart';
import 'package:xplatsurveydemo/screen/question/components/submitButton.dart';

class OpenQuestion extends StatefulWidget {
  OpenQuestion({@required this.surveyDetail, @required this.index, @required this.controller});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;

  @override
  _OpenQuestionState createState() => _OpenQuestionState(surveyDetail.questions[index]);
}

class _OpenQuestionState extends State<OpenQuestion> {
  Question _question;
  final textController = TextEditingController();

  _OpenQuestionState(this._question);

  @override
  void initState() {
    super.initState();
    textController.text = _question.answers[0].value;
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
    _question.answers[0].value = textController.text;
    print('Value: ${textController.text}');
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
                          _question.questionText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //const Padding(padding: EdgeInsets.symmetric(vertical: 2.0),),
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
                          //Text(question.answers[0].toString())
//                          TextFormField(
//                            decoration: InputDecoration(
//                                labelText: 'Enter your answer'
//                            ),
//                          ),
                        TextField(
                          controller: textController,
                          keyboardType: TextInputType.multiline,
                          minLines: 3,
                          maxLines: 6,
                          decoration: InputDecoration(
                                labelText: 'Enter your answer'
                            ),
                        ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            widget.surveyDetail.questions.length == widget.index+1 ?
            SubmitButton(onPressed: () => submitSurvey(widget.surveyDetail),) : NextButton(onPressed: () => widget.controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),),
          ],
        )
    );
  }
}
