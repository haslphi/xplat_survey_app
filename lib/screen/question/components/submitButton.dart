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
          label: Text('Submit Survey'),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
