import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function onPressed;

  SubmitButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton.extended(
          icon: Icon(Icons.send),
          label: Text('Submit'),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
