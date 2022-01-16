import 'package:flutter/material.dart';
import 'package:sagile_mobile_main/pages/login.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: const LoginPage(),
      // home: const RegisterPage(),
      // home: const CreateModel_Task(),
    );
  }
}
