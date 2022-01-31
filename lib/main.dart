import 'package:flutter/material.dart';
import 'package:sagile_mobile_main/pages/create_task_application.dart';
import 'package:sagile_mobile_main/pages/login_application.dart';
import 'package:sagile_mobile_main/pages/register_application.dart';
import 'package:sagile_mobile_main/pages/view_task_application.dart';

Widget loginPage = const LoginWidget();
Widget registerPage = const RegisterWidget();
Widget taskcreatePage = const TaskCreateWidget();
Widget taskviewPage = const TaskViewWidget();

Widget homePage = loginPage;
// Widget homePage = registerPage;
// Widget homePage = taskcreatePage;
// Widget homePage = taskviewPage;

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
        primarySwatch: Colors.blue,
      ),
      home: const TaskViewWidget(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginWidget(),
        '/taskView': (context) => const TaskViewWidget(),
        '/taskCreate': (context) => const TaskCreateWidget(),
      },
    );
  }

  // Route<dynamic>? _getRoute(RouteSettings settings) {
  //   if (settings.name != '/login') {
  //     return null;
  //   }

  //   return MaterialPageRoute<void>(
  //     settings: settings,
  //     builder: (BuildContext context) => const LoginWidget(),
  //     fullscreenDialog: true,
  //   );
  // }
}
