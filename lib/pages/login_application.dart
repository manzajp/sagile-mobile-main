import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../static.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // Required for form validations
  final formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future _detailsUser() async {
    try {
      final res = await http.post(
        Uri.parse("${Env.URL_PREFIX}/users/details.php"),
        body: {
          "username": usernameController.text,
          "password": passwordController.text,
        },
      );
      var result = json.decode(res.body)['result'];
      if (result == true) {
        setState(() {
          formKey.currentState!.validate();
        });
        print(result);
        print('bruh da login tahniah');
      
      } else {
        setState(() {
          formKey.currentState!.validate();
        });
        print('bruh acc xdoi pun - wrong user/pw');
      }
      print("received respond!"); 
    } on Exception catch (e) {
      // TODO
      print('no server 404 nig-');
    }
  }

  void _onLogIn(context) async {
    await _detailsUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'SAgile',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 50),
                alignment: Alignment.center,
              ),
              Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: TextFormField(
                          controller: usernameController,
                          style: GoogleFonts.robotoCondensed(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username here...',
                          ),
                          validator: (username){
                            if (username!.length < 8) {
                              return 'Username must be more than 7 character!';
                            }
                            return null;
                          },
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: TextFormField(
                          controller: passwordController,
                          style: GoogleFonts.robotoCondensed(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password here...',
                          ),
                          obscureText: true,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'Please enter a password!';
                            }
                            return null;
                          },
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        alignment: Alignment.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: ElevatedButton(
                            onPressed: (){
                              if (formKey.currentState!.validate()) {
                                _onLogIn(context);
                              }
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 14.0, fontWeight: FontWeight.normal),
                            )),
                      ),
                    ]),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account yet? ",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 12.0, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                        key: null,
                        onPressed: buttonPressed,
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"),
                        ))
                  ])
            ]),
      ),
    );
  }

  void buttonPressed() {}
}
