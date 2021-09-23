import 'package:flutter/material.dart';

import 'pages/homepage.dart';
import 'pages/login.dart';

void main() {
  runApp(SAgile());
}

class SAgile extends StatelessWidget {
  var _login = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAgile Mobile',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.indigo, accentColor: Colors.indigo[100]),
      ),
      home: _FrontPage(),
    );
  }

  Widget _FrontPage() {
    if (_login) return Homepage();
    return Login();
  }
}
