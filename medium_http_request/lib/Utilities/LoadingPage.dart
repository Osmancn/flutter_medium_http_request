import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  static void show(BuildContext context) => Navigator.of(context, rootNavigator: true).push(
        PageRouteBuilder(pageBuilder: (context, _, __) => LoadingPage(), opaque: false),
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: Color(0x80000000),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
