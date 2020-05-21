import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';

class RatingQuestion extends StatefulWidget {
  const RatingQuestion({@required this.surveyDetail, @required this.index, @required this.controller});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;

  @override
  _RatingQuestionState createState() => _RatingQuestionState();
}

class _RatingQuestionState extends State<RatingQuestion> {
  List rowHeaders = new List();
  List columnHeaders = new List();
  Map selected = new Map();
  Question question;

  @override
  void initState() {
    super.initState();
    saveHeaders(); //Iterate and store all Row and column Headers
  }

  saveHeaders() {
    //Creating All Headers
    question = widget.surveyDetail.questions[widget.index];
    for (int i = 1; i <= int.parse(question.answers[0].max); i++) {
      columnHeaders.add(i.toString());
    }
    rowHeaders = question.answers.map((a) => a.answerText).toList();
  }

  Widget build(BuildContext context) {
        return new OrientationBuilder(builder: (context, orientation) {
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
                            //const Padding(padding: EdgeInsets.symmetric(vertical: 2.0),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                    SingleChildScrollView(
                      scrollDirection: orientation ==
                          Orientation
                              .portrait //Handle Scroll when Orientation is changed
                          ? Axis.horizontal
                          : Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            color: Colors.blueGrey[200],
                            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                            alignment: FractionalOffset.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //headers
                                new Container(
                                  margin: EdgeInsets.all(0.0),
                                  child: new Row(
                                      children: [
                                        new Container(
                                          alignment: FractionalOffset.center,
                                          width: 140.0,
                                          margin: EdgeInsets.all(0.0),
                                          padding: const EdgeInsets.only(
                                              top: 5.0, bottom: 5.0, right: 3.0, left: 3.0),
                                          child: Text(
                                            //Leave an empty text in Row(0) and Column (0)
                                            "",
                                            style: TextStyle(color: Colors.grey[800]),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ]..addAll(columnHeaders
                                          .map((header) => new Container(
                                        alignment: FractionalOffset.center,
                                        width: 120.0,
                                        margin: EdgeInsets.all(0.0),
                                        padding: const EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 5.0,
                                            right: 3.0,
                                            left: 3.0),
                                        child: new Text(
                                          header,
                                          style:
                                          TextStyle(color: Colors.grey[800]),
                                          textAlign: TextAlign.center,
                                        ),
                                      ))
                                          .toList())),
                                ),
                              ],
                            ),
                          )
                        ]..addAll(createRows()), //Create Rows
                      ),
                    ),
              ],
            ),
          );
        });
//    );
  }

  List<Widget> createRows() {
    List<Widget> allRows = new List(); //For Saving all Created Rows

    for (int i = 0; i < rowHeaders.length; i++) {
      List<Widget> singleRow = new List(); //For creating a single row
      for (int j = 0; j < columnHeaders.length; j++) {
        singleRow.add(Container(
            alignment: FractionalOffset.center,
            width: 120.0,
            padding: const EdgeInsets.only(
                top: 6.0, bottom: 6.0, right: 3.0, left: 3.0),
            child: Radio(
              value: j, //Index of created Radio Button
              groupValue: selected[rowHeaders[i]] !=
                  null //If groupValue is equal to value, the radioButton will be selected
                  ? selected[rowHeaders[i]]
                  : "",
              onChanged: (value) {
                this.setState(() {
                  selected[rowHeaders[i]] =
                      value; //Adding selected rowName with its Index in a Map tagged "selected"
                  print("${rowHeaders[i]} ==> $value");
                });
              },
            )));
      }
      //Adding single Row to allRows widget
      allRows.add(new Container(
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),),
          ),
          child: new Row(
            children: [
              new Container(
                alignment: FractionalOffset.centerLeft,
                width: 140.0,
                padding: const EdgeInsets.only(
                    top: 6.0, bottom: 6.0, right: 3.0, left: 10.0),
                child:
                Text(rowHeaders[i], style: TextStyle(color: Colors.grey[800])),
              )
            ]..addAll(singleRow), //Add single row here
          )));
    }
    return allRows; //Return all single rows
  }
}