import 'package:flutter/material.dart';
// import 'package:sagile_mobile_main/pages/login_application.dart';

// Widget homeWidget = const LoginWidget();

import 'package:sagile_mobile_main/pages/register_application.dart';

Widget homeWidget = const RegisterWidget();

void main() {
  runApp(const SAgile());
}

class SAgile extends StatelessWidget {
  const SAgile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAgile Mobile',
      theme: ThemeData(primarySwatch: Colors.green),
      home: homeWidget,
    );
  }
}
