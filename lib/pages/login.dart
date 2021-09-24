import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sagile_mobile_main/pages/calenderview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network/api.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
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
      ),
    );
  }

  String? _myDataState;

  Widget loading() {
    return FutureBuilder(builder: (context, snapshot) {
      if (_myDataState == 'Loaded') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CalenderView()));
      }
      if (_myDataState == 'Timeout') {
        return MaterialButton(
          color: Theme.of(context).backgroundColor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.refresh,
          ),
          onPressed: _loads,
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

  Future _login() async {
    var data = {'email': email, 'password': password};
    var res = await Network()
        .authData(data, '/login')
        .timeout(const Duration(seconds: 5), onTimeout: () => 'Timeout');
    // var res = await Network().authData(data, '/login');
    if (res != 'Timeout') {
      var body = json.decode(res.body);
      res = 'Loaded';
      if (body['success']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['token']));
        localStorage.setString('user', json.encode(body['user']));
        user = jsonDecode(localStorage.getString('user').toString());
      }
    }
    return res;
  }
}
