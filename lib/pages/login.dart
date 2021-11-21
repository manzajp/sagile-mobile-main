import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sagile_mobile_main/main.dart';

import 'network/api.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  late FirebaseMessaging messaging;
  String? notificationText;
  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.subscribeToTopic("messaging");
    messaging.getToken().then((value) {
      print(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message received");
      print(event.notification!.body);
      print(event.data.values);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(event.notification!.title!),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('SAgile Mobile'),
          ),
          Form(
            key: _formKey,
            // cards
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: TextFormField(
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none),
                      keyboardType: TextInputType.emailAddress,
                      validator: (emailValue) {
                        if (emailValue!.isEmpty) {
                          return 'Please enter your email!';
                        }
                        email = emailValue;
                        return null;
                      },
                    ),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: TextFormField(
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none),
                      obscureText: true,
                      validator: (pswdValue) {
                        if (pswdValue!.isEmpty) {
                          return 'Please enter your password!';
                        }
                        password = pswdValue;
                        return null;
                      },
                    ),
                    tileColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: loading(),
          ),
        ],
      ),
    );
  }

  String? _myDataState;

  Widget loading() {
    return FutureBuilder(builder: (context, snapshot) {
      if (_myDataState == 'Loaded') {
        SchedulerBinding.instance!.addPostFrameCallback((_) {
          // Navigator.of(context).restorablePushNamed(SAgile.calendarRoute);
          Navigator.of(context).restorablePushNamed(SAgile.statusRoute);
        });
      }
      if (_myDataState == 'Timeout') {
        return Column(
          children: [
            MaterialButton(
              color: Theme.of(context).backgroundColor,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.refresh,
              ),
              onPressed: _loads,
            ),
            const Text('Timed out!'),
          ],
        );
      }
      if (_myDataState == 'Loading') {
        return CircularProgressIndicator(
          color: Theme.of(context).backgroundColor,
        );
      }
      return MaterialButton(
        color: Theme.of(context).backgroundColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8.0),
        child: const Icon(
          Icons.login,
        ),
        onPressed: _loads,
      );
    });
  }

  String? user;

  Future<void> _loads() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      String? _curState = 'Loading';
      setState(() {
        _myDataState = _curState;
      });

      _curState = await _login();
      setState(() {
        _myDataState = _curState;
      });
    }
  }

  Future loginAuthData(data) async {
    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    var success;
    if (body['success']) {
      // print(body['user'].toString());
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', json.encode(body['token']));
      // localStorage.setString('user', json.encode(body['user']));
      // user = jsonDecode(localStorage.getString('user').toString());
      success = 'Loaded';
    }
    return success;
  }

  Future _login() async {
    var data = {'email': email, 'password': password};

    return await loginAuthData(data)
        .timeout(const Duration(minutes: 1), onTimeout: () => 'Timeout');
  }
}
