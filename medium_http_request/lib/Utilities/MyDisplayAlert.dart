import 'package:flutter/material.dart';

class MyDisplayAlert extends StatelessWidget {

  static Future<void> showError(BuildContext context,dynamic error)async{
    String message = error.toString();
    await showDialog(context: context, builder: (_)=>MyDisplayAlert("Error", message));
  }

  final String title;
  final String message;

  MyDisplayAlert(this.title, this.message);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text(title), content: Text(message), actions: [
      TextButton(
        child: Text("Ok"),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      )
    ]);
  }
}
