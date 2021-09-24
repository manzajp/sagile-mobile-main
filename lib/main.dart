import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/login.dart';

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
        primarySwatch: Colors.indigo,
      ),
      // home: const CalenderView(),
      home: Login(),
      // home: const CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key, @required this.user}) : super(key: key);
  final user;

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isLogin = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Login();
    if (isLogin) {
      // child = CalenderView(user: widget.user);
    }
    return child;
  }
}
