import 'package:flutter/material.dart';

import 'pages/calenderview.dart';
import 'pages/login.dart';
import 'pages/statusview.dart';
import 'routes.dart' as routes;

void main() {
  runApp(const SAgile());
}

class SAgile extends StatelessWidget {
  const SAgile({Key? key}) : super(key: key);

  static const String statusRoute = routes.statusRoute;
  static const String calendarRoute = routes.calendarRoute;
  static const String loginRoute = routes.loginRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAgile Mobile',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: loginRoute,
      routes: <String, WidgetBuilder>{
        statusRoute: (context) => const StatusViewPage(),
        calendarRoute: (context) => const CalenderViewPage(),
        loginRoute: (context) => const LoginPage(),
      },
    );
  }
}

// class CheckAuth extends StatefulWidget {
//   const CheckAuth({Key? key, @required this.user}) : super(key: key);
//   final user;
//
//   @override
//   _CheckAuthState createState() => _CheckAuthState();
// }
//
// class _CheckAuthState extends State<CheckAuth> {
//   bool isLogin = false;
//
//   @override
//   void initState() {
//     _checkIfLoggedIn();
//     super.initState();
//   }
//
//   void _checkIfLoggedIn() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var token = localStorage.getString('token');
//     if (token != null) {
//       setState(() {
//         isLogin = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child = LoginPage();
//     if (isLogin) {
//       child = StatusView();
//     }
//     return child;
//   }
// }
