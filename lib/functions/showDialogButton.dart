import 'package:flutter/material.dart';

void showDialogSingleButton(BuildContext context, String title, String message, String buttonLabel) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title:  Text(title),
        content:  Text(message),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
           FlatButton(
            child: Text(buttonLabel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}