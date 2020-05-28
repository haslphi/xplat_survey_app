import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function onPressed;

  NextButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton.extended(
          label: Text('Next'),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: onPressed,
          icon: Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
