import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final Function onPressed;

  PreviousButton({this.onPressed});

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
